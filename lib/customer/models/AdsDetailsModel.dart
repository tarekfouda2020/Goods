// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

import 'AdsDataModel.dart';
import 'AdsModel.dart';
 
part 'AdsDetailsModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class AdsDetailsModel {
  AdsDetailsModel({
    required this.adsData,
    this.relatedAds,
  });

  @JsonKey(name: 'adsDtos')
  AdsDataModel adsData;

  @JsonKey(name: 'relatedAds')
  List<AdsModel>? relatedAds;

  factory AdsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdsDetailsModelToJson(this);
}
