// ignore_for_file: file_names, deprecated_member_use
import 'package:json_annotation/json_annotation.dart';
part 'OffersHeaderModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class OffersHeaderModel {
  OffersHeaderModel({
    required this.id,
    required this.title,
    required this.icon,
  });
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'icon')
  String icon;

  factory OffersHeaderModel.fromJson(Map<String, dynamic> json) =>
      _$OffersHeaderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OffersHeaderModelToJson(this);
}
