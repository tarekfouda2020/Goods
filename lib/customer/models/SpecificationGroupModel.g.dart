// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecificationGroupModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecificationGroupModel _$SpecificationGroupModelFromJson(
        Map<String, dynamic> json) =>
    SpecificationGroupModel(
      name: json['value'] as String,
      id: json['id'] as int,
      specificationsList: (json['specificationsList'] as List<dynamic>)
          .map((e) => SpecificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedId: json['selectedId'] as int?,
    );

Map<String, dynamic> _$SpecificationGroupModelToJson(
        SpecificationGroupModel instance) =>
    <String, dynamic>{
      'value': instance.name,
      'id': instance.id,
      'selectedId': instance.selectedId,
      'specificationsList': instance.specificationsList,
    };
