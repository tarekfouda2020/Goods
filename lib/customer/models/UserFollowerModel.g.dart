// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserFollowerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFollowerModel _$UserFollowerModelFromJson(Map<String, dynamic> json) =>
    UserFollowerModel(
      id: json['id'] as int,
      fKUserFollow: json['fK_UserFollow'] as String,
      adsId: json['adsId'] as int,
      type: json['type'] as int,
      titleAds: json['titleAds'] as String,
      date: json['date'] as String,
      userName: json['userName'] as String,
      userId: json['userID'] as String,
    );

Map<String, dynamic> _$UserFollowerModelToJson(UserFollowerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fK_UserFollow': instance.fKUserFollow,
      'adsId': instance.adsId,
      'type': instance.type,
      'titleAds': instance.titleAds,
      'date': instance.date,
      'userName': instance.userName,
      'userID': instance.userId,
    };
