// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

part 'ChatModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ChatModel {
  ChatModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.lastMessage,
    required this.date,
    required this.count,
    required this.image,
    required this.online,
  });
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'count')
  int count;
  @JsonKey(name: 'userId')
  String userId;
  @JsonKey(name: 'userName')
  String userName;
  @JsonKey(name: 'lastMessage')
  String lastMessage;
  @JsonKey(name: 'image')
  String image;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'online')
  bool online;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
