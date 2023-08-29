// ignore_for_file: deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

part 'HashTagListItemModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class HashTagListItemModel {
  @JsonKey(name: 'catId')
  int catId;
  @JsonKey(name: 'catName')
  String catName;

  HashTagListItemModel({
    required this.catId,
    required this.catName,
  });

  factory HashTagListItemModel.fromJson(Map<String, dynamic> json) =>
      _$HashTagListItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$HashTagListItemModelToJson(this);
}
