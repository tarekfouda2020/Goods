// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdsDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsDetailsModel _$AdsDetailsModelFromJson(Map<String, dynamic> json) =>
    AdsDetailsModel(
      adsData: AdsDataModel.fromJson(json['adsDtos'] as Map<String, dynamic>),
      relatedAds: (json['relatedAds'] as List<dynamic>?)
          ?.map((e) => AdsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdsDetailsModelToJson(AdsDetailsModel instance) =>
    <String, dynamic>{
      'adsDtos': instance.adsData,
      'relatedAds': instance.relatedAds,
    };
