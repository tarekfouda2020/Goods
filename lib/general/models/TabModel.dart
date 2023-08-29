// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

import 'PageModel.dart';

part 'TabModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class TabModel {
  TabModel({
    required this.place,
    required this.pages,
  });

  int place;
  List<PageModel> pages;

  factory TabModel.fromJson(Map<String, dynamic> json) =>
      _$TabModelFromJson(json);

  Map<String, dynamic> toJson() => _$TabModelToJson(this);
}
