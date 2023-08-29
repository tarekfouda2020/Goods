// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EditAdModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditAdModel _$EditAdModelFromJson(Map<String, dynamic> json) => EditAdModel(
      id: json['id'] as int,
      title: json['title'] as String,
      img: json['img'] as String,
      date: json['date'] as String,
      userName: json['userName'] as String,
      location: json['location'] as String,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      countComment: json['countComment'] as int,
      checkRate: json['checkRate'] as bool,
      allImg:
          (json['allImg'] as List<dynamic>).map((e) => e as String).toList(),
      checkWishList: json['checkWishList'] as bool,
      fromAppOrNo: json['fromAppOrNo'] as bool,
      info: AdsDataModel.fromJson(json['adsInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditAdModelToJson(EditAdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
      'date': instance.date,
      'userName': instance.userName,
      'location': instance.location,
      'lat': instance.lat,
      'lng': instance.lng,
      'countComment': instance.countComment,
      'fromAppOrNo': instance.fromAppOrNo,
      'checkRate': instance.checkRate,
      'checkWishList': instance.checkWishList,
      'allImg': instance.allImg,
      'adsInfo': instance.info,
    };
