import 'dart:io';

class RegisterDataModel {
  final String userName, phone, password, deviceId, lang,phoneCode;
  final int typeUser, cityId;
  final File? imgProfile;

  final String? email, commercialRegistrationNo;
  RegisterDataModel({
    required this.userName,
    required this.phone,
    required this.password,
    required this.deviceId,
    required this.phoneCode,
    required this.lang,
    this.commercialRegistrationNo,
    required this.typeUser,
    required this.cityId,
    this.email,
    this.imgProfile,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "userName": userName,
      "phone": phone,
      "password": password,
      "branchId": "1",
      "deviceId": deviceId,
      "phoneCode": phoneCode,
      "lang": lang,
      "projectName": "dbikes",
      "type_user": typeUser,
      "CityId": cityId,
    };

    if (typeUser == 2) {
      json.addAll({"CommercialRegistrationNo": commercialRegistrationNo});
    }
    if (typeUser == 1) {
      json.addAll({"imgProfile": imgProfile});
    }
    if (typeUser == 1 && email != null) {
      json.addAll({"Email": email});
    }
    return json;
  }
}
