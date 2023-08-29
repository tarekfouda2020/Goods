
// ignore_for_file: file_names

import 'dart:convert';

SettingModel settingModelFromJson(String str) =>
    SettingModel.fromJson(json.decode(str));

String settingModelToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
  SettingModel({
    this.facebook,
    this.instgram,
    // this.condtions,
    this.phone,
    this.snapchat,
    this.twitter,
    // this.aboutUs,
    this.delivery,
    this.title1,
    this.description1,
    this.title2,
    this.description2,
    this.title3,
    this.description3,
    this.address,
  });

  String? facebook;
  String? instgram;
  // String condtions;
  String? phone;
  String? snapchat;
  String? twitter;
  // String aboutUs;
  int? delivery;
  String? title1;
  String? description1;
  String? title2;
  String? description2;
  String? title3;
  String? description3;
  String? address;

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        facebook: json["facebook"],
        instgram: json["instgram"],
        // condtions: json["Condtions"],
        phone: json["phone"],
        snapchat: json["snapchat"],
        twitter: json["twitter"],
        // aboutUs: json["aboutUs"],
        delivery: json["delivery"],
        title1: json["Title1"],
        description1: json["Description1"],
        title2: json["Title2"],
        description2: json["Description2"],
        title3: json["Title3"],
        description3: json["Description3"],
        address: json["Address"],
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook,
        "instgram": instgram,
        // "Condtions": condtions,
        "phone": phone,
        "snapchat": snapchat,
        "twitter": twitter,
        // "aboutUs": aboutUs,
        "delivery": delivery,
        "Title1": title1,
        "Description1": description1,
        "Title2": title2,
        "Description2": description2,
        "Title3": title3,
        "Description3": description3,
        "Address": address,
      };
}
