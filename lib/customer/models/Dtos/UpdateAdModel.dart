// ignore_for_file: file_names

import 'dart:io';

class UpdateAdModel {
  UpdateAdModel(
      {this.images,
      this.lang,
      this.title,
      this.location,
      this.description,
      this.lng,
      this.lat,
      this.fkCity,
      this.phoneCode,
      this.fkDistrict,
      this.fkRegion,
      this.adsId,
      this.closeReply,
      this.showMap,
      this.showPhone,
      this.phone,
      this.fromAppOrNo,
      this.price,
      this.video,
      this.determinePrice});

  String? adsId;
  String? fkRegion;
  String? fkCity;
  String? fkDistrict;
  String? title;
  String? lat;
  String? lng;
  File? video;
  String? location;
  String? closeReply;
  String? showMap;
  String? showPhone;
  String? description;
  String? lang;
  String? phone;
  String? phoneCode;
  bool? fromAppOrNo;
  String? price;
  String? determinePrice;
  List<File>? images;

  Map<String, dynamic> toJson() => {
        "imgs": images,
        "FkRegoin": fkRegion,
        "AdsId": adsId,
        "FkCity": fkCity,
        "FkDistrict": fkDistrict,
        "CloseReply": closeReply,
        "lat": lat,
        "lng": lng,
        "Location": location,
        "ShowMap": showMap,
        "Description": description,
        "lang": lang,
        "Title": title,
        "showPhone": showPhone,
        "phone": phone,
        "phoneCode": phoneCode,
        "fromAppOrNo": fromAppOrNo,
        "determinePrice": determinePrice,
        "price": price,
        "video": video
      };
}
