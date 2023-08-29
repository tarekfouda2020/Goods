// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:heraggoods/customer/models/ContactModel.dart';
import 'package:heraggoods/customer/models/DropDownModel.dart';
import 'package:heraggoods/customer/models/Dtos/RegisterModel.dart';
import 'package:heraggoods/customer/models/Dtos/UpdateProfileModel.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/general/blocs/user_cubit/user_cubit.dart';
import 'package:heraggoods/general/constants/GlobalState.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/models/UserModel.dart';
import 'package:heraggoods/general/utilities/dio_helper/DioImports.dart';
import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';

import '../../general/utilities/routers/RouterImports.gr.dart';

class CustomerAuthMethods {
  final BuildContext context;

  CustomerAuthMethods(this.context);

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<RegisterModel?> sendCode(String phone) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang, "Phone": phone};
    var data = await DioHelper(context: context).get("/api/v1/Send_code", body);
    if (data != null) {
      return RegisterModel(
          phone: phone, lang: lang, code: "${data["date"]["code"]}");
    } else {
      return null;
    }
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "newPassword": newPassword,
      "oldPassword": oldPassword
    };
    var data =
        await DioHelper(context: context).post("/api/v1/ChangePassward", body);
    return data != null;
  }

  Future<RegisterModel> resendCode(RegisterModel model) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {"lang": lang, "Phone": model.phone};
    var data =
        await DioHelper(context: context).post("/api/v1/Send_code", body);

    model.code = data["date"]["code"].toString();
    return model;
  }

  Future<bool> userRegister(RegisterModel model) async {
    var token = await _firebaseMessaging.getToken();
    model.deviceId = token;
    var data = await DioHelper(context: context)
        .post("/api/v1/register", model.toJson());
    if (data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateUserData(UpdateProfileModel model) async {
    var data = await DioHelper(context: context)
        .uploadFile("/api/v1/UpdateDataUser", model.toJson());
    if (data != null) {
      UserModel user = UserModel.fromJson(data["data"]);
      user.token = GlobalState.instance.get("token");
      await Utils.saveUserData(user);
      context.read<UserCubit>().onUpdateUserData(user);
      return true;
    } else {
      return false;
    }
  }

  Future<List<DropDownModel>> getContactReasons() async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var data = await DioHelper(context: context)
        .get("/api/v1/ListReasonContactUs", body);
    if (data != null) {
      return List<DropDownModel>.from(
          data["data"].map((e) => DropDownModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<ContactModel> getContactInfo() async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var data =
        await DioHelper(context: context).get("/api/v1/GetInfoContact", body);
    if (data != null) {
      return ContactModel.fromJson(data["data"]);
    } else {
      return ContactModel(
        address: '',
        email: '',
        lat: '',
        lng: '',
        phone: '',
      );
    }
  }

  Future<bool> contactUs({
    required String email,
    required String msg,
    required String reasonId,
    required File? file,
  }) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "lang": lang,
      "FK_ReasonContact": reasonId,
      "Message": msg,
      "PhoneOrEmail": email,
    };
    if (file != null) {
      body.addAll({"FileName": file});
    }
    var data = await DioHelper(context: context)
        .uploadFile("/api/v1/AddContactUsByReason", body);
    if (data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> removeAccount() async {
    LoadingDialog.showLoadingDialog();
    Map<String, dynamic> body = {
      "lang": context.read<LangBloc>().state.lang,
    };
    debugPrint(body.toString());
    await DioHelper(context: context).post("/api/v1/RemoveAccount", body);
    EasyLoading.dismiss().then((value) {
      Utils.clearSavedData();
      AutoRouter.of(context).replaceAll([const LoginRoute()]);
    });
  }
}
