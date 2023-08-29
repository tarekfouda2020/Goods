// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TabModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TabModel _$TabModelFromJson(Map<String, dynamic> json) => TabModel(
      place: json['place'] as int,
      pages: (json['pages'] as List<dynamic>)
          .map((e) => PageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TabModelToJson(TabModel instance) => <String, dynamic>{
      'place': instance.place,
      'pages': instance.pages,
    };
