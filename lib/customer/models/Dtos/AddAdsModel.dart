// ignore_for_file: file_names

import 'dart:io';

import '../../../general/utilities/moor_db/db.dart';

 
class AddAdsModel {
  AddAdsModel({
    this.showMap,
    this.images,
    this.lang,
    this.title,
    this.location,
    this.phone,
    this.description,
    this.price,
    this.phoneCode,
    this.lng,
    this.lat,
    this.determinePrice,
    this.fkCat,
    this.fkCity,
    this.fkDistrict,
    this.fkHeaderAds,
    this.fkRegion,
    this.fromAppOrNo,
    this.showPhone,
    this.category,
    this.video,
  });

  bool? showMap;
  String? fkHeaderAds;
  String? fkRegion;
  String? fkCity;
  String? fkCat;
  String? fkDistrict;
  String? title;
  String? lat;
  String? lng;
  String? location;
  String? determinePrice;
  String? showPhone;
  String? phone;
  String? price;
  String? description;
  String? notes;
  String? phoneCode;
  bool? closeReply;
  String? lang;
  Category? category;
  String? fromAppOrNo;
  File ? video;
  List<File>? images;

  Map<String, dynamic> toJson() => {
        "ShowMap": showMap,
        "imgs": images,
        "fkRegoin": fkRegion,
        "fkHeaderAds": fkHeaderAds,
        "fkCity": fkCity,
        "fkCat": fkCat,
        "fkDistrict": fkDistrict,
        "title": title,
        "lat": lat,
        "lng": lng,
        "location": location,
        "determinePrice": determinePrice,
        "showPhone": showPhone,
        "phone": phone,
        "closeReply": closeReply,
        "price": price,
        "phoneCode": phoneCode,
        "description": description,
        "FromAppOrNo": fromAppOrNo,
        "lang": lang,
        "notes": notes
      };
}
