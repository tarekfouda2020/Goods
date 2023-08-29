// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DropDownModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropDownModel _$DropDownModelFromJson(Map<String, dynamic> json) =>
    DropDownModel(
      id: json['id'] as int,
      name: json['name'] as String,
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$DropDownModelToJson(DropDownModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'selected': instance.selected,
    };
