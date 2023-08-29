// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

part 'MessageModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class MessageModel {
  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.date,
  });
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'senderId')
  String senderId;
  @JsonKey(name: 'receiverId')
  String receiverId;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'date')
  String date;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
