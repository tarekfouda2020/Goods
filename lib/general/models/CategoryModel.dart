// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

part 'CategoryModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.img,
    required this.parentId,
    required this.isActive,
    required this.list,
    required this.selected,
    required this.showSideManu,
  });
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'img')
  String img;
  @JsonKey(name: 'parentId')
  int parentId;
  @JsonKey(name: 'isActive')
  bool isActive; 
  @JsonKey(defaultValue: false, includeIfNull: true)
  bool selected;
  @JsonKey(name: 'showSideManu')
  bool showSideManu;
  @JsonKey(name: 'list')
  List<CategoryModel> list;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
  @override
  String toString() {
    return name;
  }
}
