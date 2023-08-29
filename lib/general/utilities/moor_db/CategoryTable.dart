 // ignore_for_file: file_names

 import 'package:moor_flutter/moor_flutter.dart';
// Define tables that can model a database of recipes.

@DataClassName('Category')
class Categories extends Table {

  IntColumn get idU => integer()();
  IntColumn get id => integer().nullable()();
  TextColumn get name => text()();
  TextColumn get nameEn => text().nullable()();
  TextColumn get desc => text().nullable()();
  TextColumn get descEn => text().nullable()();
  TextColumn get img => text().nullable()();
  IntColumn get parentId => integer().nullable()();
  BoolColumn get selected => boolean().withDefault(const Constant(false))();
  BoolColumn get showSideManu => boolean().withDefault(const Constant(false))();


  @override
  Set<Column> get primaryKey => {idU};

  @override
  String toString() {
    return name.toString();
  }



}


// idU: serializer.fromJson<int>(json['id']),
// id: serializer.fromJson<int?>(json['id']),
// name: serializer.fromJson<String>(json['name']),
// nameEn: serializer.fromJson<String?>(json['nameEn']),
// desc: serializer.fromJson<String?>(json['desc']),
// descEn: serializer.fromJson<String?>(json['descEn']),
// img: serializer.fromJson<String?>(json['img']),
// parentId: serializer.fromJson<int?>(json['parentId']),
// selected: serializer.fromJson<bool>(json['selected']??false),
// showSideManu: serializer.fromJson<bool>(json['showSideManu']??false),
