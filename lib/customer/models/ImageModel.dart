// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';
part 'ImageModel.g.dart'; 


@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ImageModel {
  ImageModel({required this.url, required this.id});
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'id')
  int id;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
