// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecificationHeaderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecificationHeaderModel _$SpecificationHeaderModelFromJson(
        Map<String, dynamic> json) =>
    SpecificationHeaderModel(
      title: json['title'] as String,
      id: json['id'] as int,
      groupList: (json['valueHeaderSpecifications'] as List<dynamic>)
          .map((e) =>
              SpecificationGroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedId: json['selectedId'] as int? ?? 0,
    );

Map<String, dynamic> _$SpecificationHeaderModelToJson(
        SpecificationHeaderModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'selectedId': instance.selectedId,
      'valueHeaderSpecifications': instance.groupList,
    };
