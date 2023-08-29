// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      id: json['id'] as int,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      lastMessage: json['lastMessage'] as String,
      date: json['date'] as String,
      count: json['count'] as int,
      image: json['image'] as String,
      online: json['online'] as bool,
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'userId': instance.userId,
      'userName': instance.userName,
      'lastMessage': instance.lastMessage,
      'image': instance.image,
      'date': instance.date,
      'online': instance.online,
    };
