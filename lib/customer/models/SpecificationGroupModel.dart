// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

import 'SpecificationModel.dart';

part 'SpecificationGroupModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class SpecificationGroupModel {
  SpecificationGroupModel({
    required this.name,
    required this.id,
    required this.specificationsList,
    required this.selectedId,
  });

  @JsonKey(name: 'value')
  String name;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'selectedId')
  int? selectedId;
  @JsonKey(name: 'specificationsList')
  List<SpecificationModel> specificationsList;

  factory SpecificationGroupModel.fromJson(Map<String, dynamic> json) =>
      _$SpecificationGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecificationGroupModelToJson(this);
}
