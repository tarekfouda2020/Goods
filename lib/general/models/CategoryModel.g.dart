// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      img: json['img'] as String,
      parentId: json['parentId'] as int,
      isActive: json['isActive'] as bool,
      list: (json['list'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      selected: json['selected'] as bool? ?? false,
      showSideManu: json['showSideManu'] as bool,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img': instance.img,
      'parentId': instance.parentId,
      'isActive': instance.isActive,
      'selected': instance.selected,
      'showSideManu': instance.showSideManu,
      'list': instance.list,
    };
