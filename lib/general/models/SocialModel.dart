// To parse this JSON data, do
//
//     final socialModel = socialModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

SocialModel socialModelFromJson(String str) => SocialModel.fromJson(json.decode(str));

String socialModelToJson(SocialModel data) => json.encode(data.toJson());

class SocialModel {
  SocialModel({
    required this.phone,
    required this.email,
    required this.whatsapp,
    required this.emailChat,
    required this.location,
    required this.facebook,
    required this.instgram,
    required this.twitter,
    required this.linkedin,
  });

  String phone;
  String email;
  String whatsapp;
  String emailChat;
  String location;
  String facebook;
  String instgram;
  String twitter;
  String linkedin;

  factory SocialModel.fromJson(Map<String, dynamic> json) => SocialModel(
    phone: json["phone"],
    email: json["email"],
    whatsapp: json["whatsapp"],
    emailChat: json["email_chat"],
    location: json["location"],
    facebook: json["facebook"],
    instgram: json["instgram"],
    twitter: json["twitter"],
    linkedin: json["linkedin"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "email": email,
    "whatsapp": whatsapp,
    "email_chat": emailChat,
    "location": location,
    "facebook": facebook,
    "instgram": instgram,
    "twitter": twitter,
    "linkedin": linkedin,
  };
}
