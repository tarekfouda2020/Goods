// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: annotate_overrides

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Category extends DataClass implements Insertable<Category> {
  final int idU;
  final int? id;
  final int? orderBy;
  final String name;
  final String? nameEn;
  final String? desc;
  final String? descEn;
  final String? img;
  final int? parentId;
  final bool selected;
  final bool showSideManu;

  Category(
      {required this.idU,
      this.id,
      this.orderBy,
      required this.name,
      this.nameEn,
      this.desc,
      this.descEn,
      this.img,
      this.parentId,
      required this.selected,
      required this.showSideManu});

  factory Category.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Category(
      idU: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_u'])!,
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      orderBy: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}orderBy']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nameEn: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_en']),
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc']),
      descEn: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc_en']),
      img: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}img']),
      parentId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_id']),
      selected: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}selected'])!,
      showSideManu: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}show_side_manu'])!,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_u'] = Variable<int>(idU);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || orderBy != null) {
      map['orderBy'] = Variable<int?>(orderBy);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || nameEn != null) {
      map['name_en'] = Variable<String?>(nameEn);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String?>(desc);
    }
    if (!nullToAbsent || descEn != null) {
      map['desc_en'] = Variable<String?>(descEn);
    }
    if (!nullToAbsent || img != null) {
      map['img'] = Variable<String?>(img);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int?>(parentId);
    }
    map['selected'] = Variable<bool>(selected);
    map['show_side_manu'] = Variable<bool>(showSideManu);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      idU: Value(idU),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      orderBy: orderBy == null && nullToAbsent
          ? const Value.absent()
          : Value(orderBy),
      name: Value(name),
      nameEn:
          nameEn == null && nullToAbsent ? const Value.absent() : Value(nameEn),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      descEn:
          descEn == null && nullToAbsent ? const Value.absent() : Value(descEn),
      img: img == null && nullToAbsent ? const Value.absent() : Value(img),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      selected: Value(selected),
      showSideManu: Value(showSideManu),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Category(
      idU: serializer.fromJson<int>(json['id']),
      id: serializer.fromJson<int?>(json['id']),
      //orderBy
      orderBy: serializer.fromJson<int?>(json['orderBy']),
      name: serializer.fromJson<String>(json['name']),
      nameEn: serializer.fromJson<String?>(json['nameEn']),
      desc: serializer.fromJson<String?>(json['desc']),
      descEn: serializer.fromJson<String?>(json['descEn']),
      img: serializer.fromJson<String?>(json['img']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      selected: serializer.fromJson<bool>(json['selected'] ?? false),
      showSideManu: serializer.fromJson<bool>(json['showSideManu'] ?? false),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idU': serializer.toJson<int>(idU),
      'id': serializer.toJson<int?>(id),
      'orderBy': serializer.toJson<int?>(orderBy),
      'name': serializer.toJson<String>(name),
      'nameEn': serializer.toJson<String?>(nameEn),
      'desc': serializer.toJson<String?>(desc),
      'descEn': serializer.toJson<String?>(descEn),
      'img': serializer.toJson<String?>(img),
      'parentId': serializer.toJson<int?>(parentId),
      'selected': serializer.toJson<bool>(selected),
      'showSideManu': serializer.toJson<bool>(showSideManu),
    };
  }

  Category copyWith(
          {int? idU,
          int? id,
          int? orderBy,
          String? name,
          String? nameEn,
          String? desc,
          String? descEn,
          String? img,
          int? parentId,
          bool? selected,
          bool? showSideManu}) =>
      Category(
        idU: idU ?? this.idU,
        id: id ?? this.id,
        orderBy: orderBy ?? this.orderBy,
        name: name ?? this.name,
        nameEn: nameEn ?? this.nameEn,
        desc: desc ?? this.desc,
        descEn: descEn ?? this.descEn,
        img: img ?? this.img,
        parentId: parentId ?? this.parentId,
        selected: selected ?? this.selected,
        showSideManu: showSideManu ?? this.showSideManu,
      );

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('idU: $idU, ')
          ..write('id: $id, ')
          ..write('orderBy: $orderBy, ')
          ..write('name: $name, ')
          ..write('nameEn: $nameEn, ')
          ..write('desc: $desc, ')
          ..write('descEn: $descEn, ')
          ..write('img: $img, ')
          ..write('parentId: $parentId, ')
          ..write('selected: $selected, ')
          ..write('showSideManu: $showSideManu')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idU, id, orderBy, name, nameEn, desc, descEn,
      img, parentId, selected, showSideManu);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.idU == this.idU &&
          other.id == this.id &&
          other.orderBy == this.orderBy &&
          other.name == this.name &&
          other.nameEn == this.nameEn &&
          other.desc == this.desc &&
          other.descEn == this.descEn &&
          other.img == this.img &&
          other.parentId == this.parentId &&
          other.selected == this.selected &&
          other.showSideManu == this.showSideManu);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> idU;
  final Value<int?> id;
  final Value<int?> orderBy;
  final Value<String> name;
  final Value<String?> nameEn;
  final Value<String?> desc;
  final Value<String?> descEn;
  final Value<String?> img;
  final Value<int?> parentId;
  final Value<bool> selected;
  final Value<bool> showSideManu;

  const CategoriesCompanion({
    this.idU = const Value.absent(),
    this.id = const Value.absent(),
    this.orderBy = const Value.absent(),
    this.name = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.desc = const Value.absent(),
    this.descEn = const Value.absent(),
    this.img = const Value.absent(),
    this.parentId = const Value.absent(),
    this.selected = const Value.absent(),
    this.showSideManu = const Value.absent(),
  });

  CategoriesCompanion.insert({
    this.idU = const Value.absent(),
    this.id = const Value.absent(),
    this.orderBy = const Value.absent(),
    required String name,
    this.nameEn = const Value.absent(),
    this.desc = const Value.absent(),
    this.descEn = const Value.absent(),
    this.img = const Value.absent(),
    this.parentId = const Value.absent(),
    this.selected = const Value.absent(),
    this.showSideManu = const Value.absent(),
  }) : name = Value(name);

  static Insertable<Category> custom({
    Expression<int>? idU,
    Expression<int?>? id,
    Expression<int?>? orderBy,
    Expression<String>? name,
    Expression<String?>? nameEn,
    Expression<String?>? desc,
    Expression<String?>? descEn,
    Expression<String?>? img,
    Expression<int?>? parentId,
    Expression<bool>? selected,
    Expression<bool>? showSideManu,
  }) {
    return RawValuesInsertable({
      if (idU != null) 'id_u': idU,
      if (id != null) 'id': id,
      if (id != null) 'orderBy': orderBy!,
      if (name != null) 'name': name,
      if (nameEn != null) 'name_en': nameEn,
      if (desc != null) 'desc': desc,
      if (descEn != null) 'desc_en': descEn,
      if (img != null) 'img': img,
      if (parentId != null) 'parent_id': parentId,
      if (selected != null) 'selected': selected,
      if (showSideManu != null) 'show_side_manu': showSideManu,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? idU,
      Value<int?>? id,
      Value<int?>? orderBy,
      Value<String>? name,
      Value<String?>? nameEn,
      Value<String?>? desc,
      Value<String?>? descEn,
      Value<String?>? img,
      Value<int?>? parentId,
      Value<bool>? selected,
      Value<bool>? showSideManu}) {
    return CategoriesCompanion(
      idU: idU ?? this.idU,
      id: id ?? this.id,
      orderBy: orderBy ?? this.orderBy,
      name: name ?? this.name,
      nameEn: nameEn ?? this.nameEn,
      desc: desc ?? this.desc,
      descEn: descEn ?? this.descEn,
      img: img ?? this.img,
      parentId: parentId ?? this.parentId,
      selected: selected ?? this.selected,
      showSideManu: showSideManu ?? this.showSideManu,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idU.present) {
      map['id_u'] = Variable<int>(idU.value);
    }
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (orderBy.present) {
      map['orderBy'] = Variable<int?>(orderBy.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String?>(nameEn.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String?>(desc.value);
    }
    if (descEn.present) {
      map['desc_en'] = Variable<String?>(descEn.value);
    }
    if (img.present) {
      map['img'] = Variable<String?>(img.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int?>(parentId.value);
    }
    if (selected.present) {
      map['selected'] = Variable<bool>(selected.value);
    }
    if (showSideManu.present) {
      map['show_side_manu'] = Variable<bool>(showSideManu.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('idU: $idU, ')
          ..write('id: $id, ')
          ..write('orderBy: $orderBy, ')
          ..write('name: $name, ')
          ..write('nameEn: $nameEn, ')
          ..write('desc: $desc, ')
          ..write('descEn: $descEn, ')
          ..write('img: $img, ')
          ..write('parentId: $parentId, ')
          ..write('selected: $selected, ')
          ..write('showSideManu: $showSideManu')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  final GeneratedDatabase _db;
  final String? _alias;

  $CategoriesTable(this._db, [this._alias]);

  final VerificationMeta _idUMeta = const VerificationMeta('idU');
  late final GeneratedColumn<int?> idU = GeneratedColumn<int?>(
      'id_u', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  late final GeneratedColumn<int?> orderBy = GeneratedColumn<int?>(
      'orderBy', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  late final GeneratedColumn<String?> nameEn = GeneratedColumn<String?>(
      'name_en', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _descMeta = const VerificationMeta('desc');
  late final GeneratedColumn<String?> desc = GeneratedColumn<String?>(
      'desc', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _descEnMeta = const VerificationMeta('descEn');
  late final GeneratedColumn<String?> descEn = GeneratedColumn<String?>(
      'desc_en', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _imgMeta = const VerificationMeta('img');
  late final GeneratedColumn<String?> img = GeneratedColumn<String?>(
      'img', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  late final GeneratedColumn<int?> parentId = GeneratedColumn<int?>(
      'parent_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _selectedMeta = const VerificationMeta('selected');
  late final GeneratedColumn<bool?> selected = GeneratedColumn<bool?>(
      'selected', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (selected IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _showSideManuMeta =
      const VerificationMeta('showSideManu');
  late final GeneratedColumn<bool?> showSideManu = GeneratedColumn<bool?>(
      'show_side_manu', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (show_side_manu IN (0, 1))',
      defaultValue: const Constant(false));

  @override
  List<GeneratedColumn> get $columns => [
        idU,
        id,
        orderBy,
        name,
        nameEn,
        desc,
        descEn,
        img,
        parentId,
        selected,
        showSideManu
      ];

  @override
  String get aliasedName => _alias ?? 'categories';

  @override
  String get actualTableName => 'categories';

  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_u')) {
      context.handle(
          _idUMeta, idU.isAcceptableOrUnknown(data['id_u']!, _idUMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('orderBy')) {
      context.handle(
          _idMeta, orderBy.isAcceptableOrUnknown(data['orderBy']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    }
    if (data.containsKey('desc_en')) {
      context.handle(_descEnMeta,
          descEn.isAcceptableOrUnknown(data['desc_en']!, _descEnMeta));
    }
    if (data.containsKey('img')) {
      context.handle(
          _imgMeta, img.isAcceptableOrUnknown(data['img']!, _imgMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('selected')) {
      context.handle(_selectedMeta,
          selected.isAcceptableOrUnknown(data['selected']!, _selectedMeta));
    }
    if (data.containsKey('show_side_manu')) {
      context.handle(
          _showSideManuMeta,
          showSideManu.isAcceptableOrUnknown(
              data['show_side_manu']!, _showSideManuMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idU};

  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Category.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }

  @override
  DatabaseConnectionUser get attachedDatabase => throw UnimplementedError();
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CategoriesTable categories = $CategoriesTable(this);

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categories];
}
