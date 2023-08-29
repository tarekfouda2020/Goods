// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReplyModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyModel _$ReplyModelFromJson(Map<String, dynamic> json) => ReplyModel(
      id: json['id'] as int,
      fkComment: json['fk_Comment'] as int,
      text: json['text'] as String,
      creationDate: json['creationDate'] as String,
      userName: json['userName'] as String,
      fKUser: json['fK_User'] as String,
    );

Map<String, dynamic> _$ReplyModelToJson(ReplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fk_Comment': instance.fkComment,
      'text': instance.text,
      'creationDate': instance.creationDate,
      'userName': instance.userName,
      'fK_User': instance.fKUser,
    };
