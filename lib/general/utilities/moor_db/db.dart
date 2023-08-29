// These imports are only needed to open the database
// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';
import 'CategoryTable.dart';


part 'dbg.dart';


LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Categories])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  // returns the generated id
  Future<int> addTodo(CategoriesCompanion entry) {
    return into(categories).insert(entry);
  }

  // returns the list cats
  Future<List<Category>> selectAllCats() {
    return select(categories).get();
  }

  // returns the side menu list cats
  Stream<List<int>> selectSideCats() {
    return customSelect(
      'SELECT DISTINCT parent_id FROM categories WHERE show_side_manu ORDER BY id ',
      // 'SELECT * FROM categories c;',
      readsFrom: {categories}, // used for the stream: the stream will update when either table changes
    ).watch().map(((event){
      return event.map((e) => e.readInt("parent_id")).toList();
    }));
  }

  // returns the side menu list cats
  Stream<List<int?>> selectSideParent() {
    return (select(categories)..where((cat) => cat.showSideManu)).map((cat) => cat.parentId).watch();
  }

  // returns the parent list cats
  Stream<Category> selectCatData(int catId) {
    return (select(categories)..where((cat) => cat.id.equals(catId))).watchSingle();
  }

  // returns the parent list cats
  Stream<List<Category>> selectSlideChildrenCats(int parent) {
    return (select(categories)..where((cat) => cat.parentId.equals(parent)&cat.showSideManu)).watch();
  }

  // returns the parent list cats image not null
  Stream<List<Category>> selectSlideChildrenCatsNotNull(int parent) {
    return (select(categories)..where((cat) => cat.parentId.equals(parent)&cat.showSideManu&cat.img.equals("").not())).watch();
  }

  // returns the parent list cats
  Stream<List<Category>> selectParentCats() {
    return (select(categories)..where((cat) => cat.parentId.equals(0))).watch();
  }

  // returns the parent list cats
  Future<List<Category>> selectParentCatsAsync() {
    return (select(categories)..where((cat) => cat.parentId.equals(0))).get();
  }

  // returns the parent list cats
  Future<List<Category>> selectParentCatsWithoutMainAsync() {
    return (select(categories)..where((cat) => cat.parentId.equals(0)&cat.id.isBiggerThanValue(0))).get();
  }

  // returns the parent children cats
  Stream<List<Category>> selectChildrenCats(int parent) {
    return (select(categories)..where((cat) => cat.parentId.equals(parent)&cat.parentId.isBiggerThanValue(0))).watch();
  }

  // returns the parent children cats
  Future<List<Category>> selectChildrenCatsAsync(int parent) {
    return (select(categories)..where((cat) => cat.parentId.equals(parent))).get();
  }

  //insert list of cats
  Future<void> insertAllCats(List<Category> cats) async {
    await batch((batch) {
      batch.insertAll(categories, cats);
    });
  }
  //insert list of cats
  Future<void> removeAllCats() async{
    await delete(categories).go();
  }

  //insert list of cats
  Future<void> updateAllCats(List<Category> cats) async{
    debugPrint("updateAllCats =================> success}");
    await batch((batch) {
      batch.insertAllOnConflictUpdate(categories , cats);
    }).then((value) => debugPrint("=================> success}"))
        .onError((error, stackTrace) => debugPrint("======================>$error "));
  }

}