// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FilterModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
      cityId: json['cityId'] as String?,
      catId: json['catId'] as String?,
      regionId: json['regoinId'] as String?,
      pageNumber: json['pageNumber'] as String?,
      pageSize: json['pageSize'] as String?,
      typeFilter: json['typeFiltter'] as String?,
      lang: json['lang'] as String?,
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'typeFiltter': instance.typeFilter,
      'catId': instance.catId,
      'regoinId': instance.regionId,
      'cityId': instance.cityId,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'lang': instance.lang,
      'lat': instance.lat,
      'lng': instance.lng,
      'title': instance.title,
    };
