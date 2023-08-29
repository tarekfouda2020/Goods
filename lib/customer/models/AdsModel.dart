// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

import 'AdsDataModel.dart';

part 'AdsModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class AdsModel {
  AdsModel(
      {required this.id,
      required this.title,
      required this.img,
      required this.date,
      required this.userName,
      required this.location,
      required this.lat,
      required this.lng,
      required this.locationPlus,
      required this.countComment,
      required this.checkRate,
      required this.allImg,
      required this.checkWishList,
      required this.fromAppOrNo,
      required this.info});
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'img')
  String img;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'locationPlus')
  String? locationPlus;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'countComment')
  int countComment;
  @JsonKey(name: 'checkRate')
  bool checkRate;
  @JsonKey(name: 'checkWishList')
  bool checkWishList;
  @JsonKey(name: 'allImg')
  List<String> allImg;
  @JsonKey(name: 'adsInfo')
  AdsDataModel? info;
  @JsonKey(name: 'fromAppOrNo')
  bool? fromAppOrNo;

  factory AdsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdsModelToJson(this);
}
