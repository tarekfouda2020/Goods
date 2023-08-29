// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      phone: json['phone'] as String?,
      lang: json['lang'] as String?,
      password: json['password'] as String?,
      userName: json['userName'] as String?,
      projectName: json['projectName'] as String?,
      user_id: json['user_id'] as String?,
      code: json['code'] as String?,
          deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'lang': instance.lang,
      'userName': instance.userName,
      'password': instance.password,
      'projectName': instance.projectName,
      'code': instance.code,
      'user_id': instance.user_id,
      'deviceId': instance.deviceId,
    };
