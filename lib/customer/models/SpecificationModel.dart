// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

import 'PropertyModel.dart';

part 'SpecificationModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class SpecificationModel {
  SpecificationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.props,
    required this.selectedId,
    this.value = 0,
  });
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'titleSpecifications')
  String name;
  @JsonKey(name: 'type')
  int type;
  @JsonKey(name: 'selectedId')
  int? selectedId;
  @JsonKey(defaultValue: 0, ignore: true)
  int value;
  @JsonKey(name: 'valueSpecificationsList')
  List<PropertyModel> props;

  factory SpecificationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecificationModelToJson(this);
}
