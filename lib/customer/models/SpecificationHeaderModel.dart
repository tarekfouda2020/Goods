// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

import 'SpecificationGroupModel.dart';

part 'SpecificationHeaderModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class SpecificationHeaderModel {
  SpecificationHeaderModel({
    required this.title,
    required this.id,
    required this.groupList,
    required this.selectedId,
  });
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(defaultValue: 0)
  int selectedId;
  @JsonKey(name: 'valueHeaderSpecifications')
  List<SpecificationGroupModel> groupList;

  factory SpecificationHeaderModel.fromJson(Map<String, dynamic> json) =>
      _$SpecificationHeaderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecificationHeaderModelToJson(this);
}
