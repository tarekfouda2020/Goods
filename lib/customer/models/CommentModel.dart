// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

import 'ReplyModel.dart';

part 'CommentModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CommentModel {
  CommentModel({
    required this.id,
    required this.text,
    required this.creationDate,
    required this.userName,
    required this.fKUser,
    required this.fkAdsDetails,
    required this.replyList,
  });
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'creationDate')
  String creationDate;
  @JsonKey(name: 'userName')
  String userName;
  @JsonKey(name: 'fK_User')
  String fKUser;
  @JsonKey(name: 'fk_AdsDetails')
  int? fkAdsDetails;
  @JsonKey(name: 'commentReplys')
  List<ReplyModel>? replyList;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
