// ignore_for_file: unused_shown_name, deprecated_member_use, file_names, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'RegisterModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class RegisterModel {
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'lang')
  String? lang;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'projectName')
  String? projectName;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'user_id')
  String? user_id;
  @JsonKey(name: 'deviceId')
  String? deviceId;

  RegisterModel({
    this.phone,
    this.lang,
    this.password,
    this.userName,
    this.projectName,
    this.user_id,
    this.code,
    this.deviceId,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
