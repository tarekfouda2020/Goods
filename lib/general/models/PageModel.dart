// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

part 'PageModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class PageModel {
  PageModel({
    required this.name,
    required this.nameEn,
    required this.id,
    required this.showInApp,
  });
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'nameEn')
  String nameEn;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'showInApp')
  bool showInApp;

  factory PageModel.fromJson(Map<String, dynamic> json) =>
      _$PageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PageModelToJson(this);
}
