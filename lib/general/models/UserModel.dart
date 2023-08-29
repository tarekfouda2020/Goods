// ignore_for_file: unused_shown_name, deprecated_member_use, non_constant_identifier_names, file_names

import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class UserModel {
  UserModel({
    this.id,
    this.userName,
    this.email,
    this.phone,
    this.lat,
    this.lng,
    this.address,
    this.lang,
    this.closeNotify,
    this.fkBranch,
    this.imgCover,
    this.imgProfile,
    this.uniqId,
    this.lastSeen,
    this.pocketMony,
    this.phone1,
    this.phone2,
    this.phone3,
    this.token,
    this.description,
    this.followCount,
    this.rate,
    this.publishDate,
    this.blockOrNo,
    this.regionId,
    this.regionName,
    this.phoneCode,
    this.type_user,
    this.commercialRegistrationNo,
  });
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'lang')
  String? lang;
  @JsonKey(name: 'phoneCode')
  String? phoneCode;
  @JsonKey(name: 'commercialRegistrationNo')
  String? commercialRegistrationNo;
  @JsonKey(name: 'closeNotify')
  bool? closeNotify;
  @JsonKey(name: 'blockOrNo')
  bool? blockOrNo;
  @JsonKey(name: 'fkBranch')
  int? fkBranch;
  @JsonKey(name: 'imgCover')
  String? imgCover;
  @JsonKey(name: 'imgProfile')
  String? imgProfile;
  @JsonKey(name: 'uniqId')
  String? uniqId;
  @JsonKey(name: 'lastSeen')
  String? lastSeen;
  @JsonKey(name: 'regionName')
  String? regionName;
  @JsonKey(name: 'pocketMony')
  int? pocketMony;
  @JsonKey(name: 'regionId')
  int? regionId;
  @JsonKey(name: 'phone1')
  String? phone1;
  @JsonKey(name: 'phone2')
  String? phone2;
  @JsonKey(name: 'phone3')
  String? phone3;
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'rate')
  int? rate;
  @JsonKey(name: 'type_user')
  int? type_user;
  @JsonKey(name: 'followCount')
  int? followCount;
  @JsonKey(name: 'publishDate')
  String? publishDate;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
