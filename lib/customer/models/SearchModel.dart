// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

import 'AdsModel.dart';

part 'SearchModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class SearchModel {
  SearchModel({
    required this.id,
    required this.name,
    required this.img,
    required this.fKRegion,
    required this.dateNumberDay,
    required this.lat,
    required this.lng,
    required this.adsInfo,
  });
@JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'img')
  String img; 
  @JsonKey(name: 'fK_Region')
  int fKRegion;
  int dateNumberDay;
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'lng')
  String lng;
  @JsonKey(name: 'adsInfo')
  AdsModel adsInfo;

 factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);

  @override
  String toString() {
    return name;
  }
}
