// ignore_for_file: unused_shown_name, deprecated_member_use, file_names

import 'package:json_annotation/json_annotation.dart';

import 'CommentModel.dart';
import 'ImageModel.dart';

part 'AdsDataModel.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class AdsDataModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'fkUser')
  String fkUser;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'userName')
  String userName;
  @JsonKey(name: 'catId')
  int catId;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'whatsapp')
  String? whatsapp;
  @JsonKey(name: 'userPhone')
  String userPhone;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'phoneCode')
  String? phoneCode;
  @JsonKey(name: 'notes')
  String? notes;
  @JsonKey(name: 'locationInfo')
  String? locationInfo;
  @JsonKey(name: 'countFavorite')
  int countFavorite;
  @JsonKey(name: 'countComment')
  int countComment;
  @JsonKey(name: 'elMamsha')
  int km;
  @JsonKey(name: 'showPhone')
  bool showPhone;
  @JsonKey(name: 'price')
  num price;
  @JsonKey(name: 'userRate')
  int userRate;
  @JsonKey(name: 'fromAppOrNo')
  bool fromAppOrNo;
  @JsonKey(name: 'showPrice')
  bool showPrice;
  @JsonKey(name: 'checkFollows')
  bool checkFollows;
  @JsonKey(name: 'countReport')
  int countReport;
  @JsonKey(name: 'checkRate')
  bool checkRate;
  @JsonKey(name: 'checkReport')
  bool checkReport;
  @JsonKey(name: 'checkWishList')
  bool checkWishList;
  @JsonKey(name: 'closeReply')
  bool closeReply;
  @JsonKey(name: 'showMap')
  bool showMap;
  @JsonKey(name: 'video')
  String video;
  @JsonKey(name: 'allImg')
  List<ImageModel> allImg;
  @JsonKey(name: 'comments')
  List<CommentModel> comments;

  AdsDataModel({
    required this.id,
    required this.title,
    required this.video,
    required this.date,
    required this.userName,
    required this.catId,
    required this.location,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.description,
    required this.countFavorite,
    required this.countComment,
    required this.showPhone,
    required this.price,
    required this.showPrice,
    required this.checkFollows,
    required this.countReport,
    required this.checkRate,
    required this.checkWishList,
    required this.allImg,
    required this.fkUser,
    required this.checkReport,
    required this.fromAppOrNo,
    required this.whatsapp,
    required this.closeReply,
    required this.showMap,
    required this.userPhone,
    required this.userRate,
    required this.locationInfo,
    required this.comments,
    required this.km,
    required this.notes,
    required this.phoneCode,
  });

  factory AdsDataModel.fromJson(Map<String, dynamic> json) =>
      _$AdsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdsDataModelToJson(this);
}
