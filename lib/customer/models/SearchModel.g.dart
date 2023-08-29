// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      id: json['id'] as int,
      name: json['name'] as String,
      img: json['img'] as String,
      fKRegion: json['fK_Region'] as int,
      dateNumberDay: json['dateNumberDay'] as int,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      adsInfo: AdsModel.fromJson(json['adsInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img': instance.img,
      'fK_Region': instance.fKRegion,
      'dateNumberDay': instance.dateNumberDay,
      'lat': instance.lat,
      'lng': instance.lng,
      'adsInfo': instance.adsInfo,
    };
