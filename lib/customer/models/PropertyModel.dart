// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

part 'PropertyModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class PropertyModel {
  PropertyModel({
    required this.id,
    required this.name,
  });
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'valueSpecifications')
  String name;

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);
  @override
  String toString() {
    return name;
  }
}
