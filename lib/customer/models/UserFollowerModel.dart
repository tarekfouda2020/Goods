// ignore_for_file : unused_shown_name, deprecated_member_use

// ignore_for_file: file_names, deprecated_member_use

import 'package:json_annotation/json_annotation.dart';

part 'UserFollowerModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class UserFollowerModel {
  UserFollowerModel({
    required this.id,
    required this.fKUserFollow,
    required this.adsId,
    required this.type,
    required this.titleAds,
    required this.date,
    required this.userName,
    required this.userId,
  });
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'fK_UserFollow')
  String fKUserFollow;
  @JsonKey(name: 'adsId')
  int adsId;
  @JsonKey(name: 'type')
  int type;
  @JsonKey(name: 'titleAds')
  String titleAds;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'userName')
  String userName;
  @JsonKey(name: 'userID')
  String userId;

  factory UserFollowerModel.fromJson(Map<String, dynamic> json) =>
      _$UserFollowerModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserFollowerModelToJson(this);
}
