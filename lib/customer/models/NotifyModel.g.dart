// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotifyModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifyModel _$NotifyModelFromJson(Map<String, dynamic> json) => NotifyModel(
      id: json['id'] as int,
      text: json['text'] as String,
      date: json['date'] as String,
      adsId: json['ads_id'] as int,
      fkUser: json['fk_user'] as String,
      show: json['show'] as bool,
      type: json['type'] as int,
      userName: json['userName'] as String,
      userIdFollow: json['userIdFollow'] as String,
      adsInfo: AdsModel.fromJson(json['adsInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotifyModelToJson(NotifyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'text': instance.text,
      'date': instance.date,
      'ads_id': instance.adsId,
      'fk_user': instance.fkUser,
      'userName': instance.userName,
      'userIdFollow': instance.userIdFollow,
      'show': instance.show,
      'adsInfo': instance.adsInfo,
    };
