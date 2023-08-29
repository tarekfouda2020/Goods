// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

import 'AdsModel.dart';

part 'NotifyModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class NotifyModel {
  NotifyModel({
    required this.id,
    required this.text,
    required this.date,
    required this.adsId,
    required this.fkUser,
    required this.show,
    required this.type,
    required this.userName,
    required this.userIdFollow,
    required this.adsInfo,
  });
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'type')
  int type;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'ads_id')
  int adsId;
  @JsonKey(name: 'fk_user')
  String fkUser;
  @JsonKey(name: 'userName')
  String userName;
  @JsonKey(name: 'userIdFollow')
  String userIdFollow;
  @JsonKey(name: 'show')
  bool show;
  @JsonKey(name: 'adsInfo')
  AdsModel adsInfo;

  factory NotifyModel.fromJson(Map<String, dynamic> json) =>
      _$NotifyModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyModelToJson(this);
}
