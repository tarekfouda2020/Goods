// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecificationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecificationModel _$SpecificationModelFromJson(Map<String, dynamic> json) =>
    SpecificationModel(
      id: json['id'] as int,
      name: json['titleSpecifications'] as String,
      type: json['type'] as int,
      props: (json['valueSpecificationsList'] as List<dynamic>)
          .map((e) => PropertyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedId: json['selectedId'] as int?,
    );

Map<String, dynamic> _$SpecificationModelToJson(SpecificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleSpecifications': instance.name,
      'type': instance.type,
      'selectedId': instance.selectedId,
      'valueSpecificationsList': instance.props,
    };
