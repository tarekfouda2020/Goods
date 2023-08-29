// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

part 'AdOwnerModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class AdOwnerModel {
  AdOwnerModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
    required this.lat,
    required this.lng,
    required this.address,
    required this.lang,
    required this.fkBranch,
    required this.imgCover,
    required this.imgProfile,
    required this.uniqId,
    required this.lastSeen,
    required this.publishDate,
    required this.pocketMony,
    required this.rate,
    this.showRate,
    this.showFollow,
    required this.description,
    required this.followCount,
  });
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'userName')
  String userName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'lang')
  String lang;
  @JsonKey(name: 'fkBranch')
  int fkBranch;
  @JsonKey(name: 'imgCover')
  String imgCover;
  @JsonKey(name: 'imgProfile')
  String imgProfile;
  @JsonKey(name: 'uniqId')
  String? uniqId;
  @JsonKey(name: 'lastSeen')
  DateTime lastSeen;
  @JsonKey(name: 'publishDate')
  String publishDate;
  @JsonKey(name: 'pocketMony')
  int? pocketMony;
  @JsonKey(name: 'rate')
  int rate;
  @JsonKey(ignore: true, defaultValue: false)
  bool? showRate;
  @JsonKey(ignore: true, defaultValue: false)
  bool? showFollow;
  @JsonKey(name: 'followCount')
  int followCount;

  factory AdOwnerModel.fromJson(Map<String, dynamic> json) =>
      _$AdOwnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdOwnerModelToJson(this);
}
