// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: json['id'] as int,
      text: json['text'] as String,
      creationDate: json['creationDate'] as String,
      userName: json['userName'] as String,
      fKUser: json['fK_User'] as String,
      fkAdsDetails: json['fk_AdsDetails'] as int?,
      replyList: (json['commentReplys'] as List<dynamic>?)
          ?.map((e) => ReplyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'creationDate': instance.creationDate,
      'userName': instance.userName,
      'fK_User': instance.fKUser,
      'fk_AdsDetails': instance.fkAdsDetails,
      'commentReplys': instance.replyList,
    };
