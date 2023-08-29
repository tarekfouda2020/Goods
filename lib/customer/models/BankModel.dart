// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

part 'BankModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class BankModel {
  BankModel({
    required this.id,
    required this.img,
    required this.accountNumber,
    required this.ibandNumber,
    required this.name,
    required this.beneficiaryName,
  });
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'img')
  String img;
  @JsonKey(name: 'accountNumber')
  String accountNumber;
  @JsonKey(name: 'ibandNumber')
  String ibandNumber;
  @JsonKey(name: 'bannkName')
  String name;
  @JsonKey(name: 'beneficiaryName')
  String beneficiaryName;

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankModelToJson(this);
}
