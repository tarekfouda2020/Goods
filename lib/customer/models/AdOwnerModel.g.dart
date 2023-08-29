// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdOwnerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdOwnerModel _$AdOwnerModelFromJson(Map<String, dynamic> json) => AdOwnerModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      address: json['address'] as String?,
      lang: json['lang'] as String,
      fkBranch: json['fkBranch'] as int,
      imgCover: json['imgCover'] as String,
      imgProfile: json['imgProfile'] as String,
      uniqId: json['uniqId'] as String?,
      lastSeen: DateTime.parse(json['lastSeen'] as String),
      publishDate: json['publishDate'] as String,
      pocketMony: json['pocketMony'] as int?,
      rate: json['rate'] as int,
      description: json['description'] as String?,
      followCount: json['followCount'] as int,
    );

Map<String, dynamic> _$AdOwnerModelToJson(AdOwnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'description': instance.description,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'lang': instance.lang,
      'fkBranch': instance.fkBranch,
      'imgCover': instance.imgCover,
      'imgProfile': instance.imgProfile,
      'uniqId': instance.uniqId,
      'lastSeen': instance.lastSeen.toIso8601String(),
      'publishDate': instance.publishDate,
      'pocketMony': instance.pocketMony,
      'rate': instance.rate,
      'followCount': instance.followCount,
    };
