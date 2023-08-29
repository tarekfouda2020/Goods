// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';
part 'ReplyModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ReplyModel {
  ReplyModel({
    required this.id,
    required this.fkComment,
    required this.text,
    required this.creationDate,
    required this.userName,
    required this.fKUser,
  });
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'fk_Comment')
  int fkComment;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'creationDate')
  String creationDate;
  @JsonKey(name: 'userName')
  String userName;
  @JsonKey(name: 'fK_User')
  String fKUser;

  factory ReplyModel.fromJson(Map<String, dynamic> json) =>
      _$ReplyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyModelToJson(this);
}
