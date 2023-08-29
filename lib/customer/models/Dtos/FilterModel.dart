// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

part 'FilterModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class FilterModel {
  FilterModel({
    this.cityId,
    this.catId,
    this.regionId,
    this.pageNumber,
    this.pageSize,
    this.typeFilter,
    this.lang,
    this.lng,
    this.lat,
    this.title,
  });

  @JsonKey(name: 'typeFiltter')
  String? typeFilter;
  @JsonKey(name: 'catId')
  String? catId;
  @JsonKey(name: 'regoinId')
  String? regionId;
  @JsonKey(name: 'cityId')
  String? cityId;
  @JsonKey(name: 'pageNumber')
  String? pageNumber;
  @JsonKey(name: 'pageSize')
  String? pageSize;
  @JsonKey(name: 'lang')
  String? lang;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'title')
  String? title;

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterModelToJson(this);
}
