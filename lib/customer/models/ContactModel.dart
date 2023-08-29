// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

part 'ContactModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ContactModel {
  ContactModel({
    required this.phone,
    required this.address,
    required this.lat,
    required this.lng,
    required this.email,
  });
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'lng')
  String lng;
  @JsonKey(name: 'email')
  String email;

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}
