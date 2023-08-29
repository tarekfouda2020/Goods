// ignore_for_file: file_names

import 'dart:io';

class AddPayModel {
  String? transferName;
  String? accountNumber;
  String? notes;
  String? price;
  String? type;
  String? fKBank;
  String? adsNumber;
  String? lang;
  String? ipan;
  File? image;

  AddPayModel(
      {this.transferName,
      this.accountNumber,
      this.notes,
      this.price,
      this.type,
      this.fKBank,
      this.adsNumber,
      this.lang,
      this.image,
      this.ipan});

  Map<String, dynamic> toJson() => {
        "TransferName": transferName,
        "accountNumber": accountNumber,
        "Notes": notes,
        "Price": price,
        "fKBank": fKBank,
        "type": type,
        "AdsNumber": adsNumber,
        "lang": lang,
        "ipan": ipan,
        "Img": image,
      };
}
