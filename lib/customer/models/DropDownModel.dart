// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

part 'DropDownModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class DropDownModel {
  DropDownModel({required this.id, required this.name, required this.selected});
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(defaultValue: false, includeIfNull: true)
  bool selected;

  factory DropDownModel.fromJson(Map<String, dynamic> json) =>
      _$DropDownModelFromJson(json);

  Map<String, dynamic> toJson() => _$DropDownModelToJson(this);

  @override
  String toString() {
    return name;
  }
}
