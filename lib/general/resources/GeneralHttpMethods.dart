// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:heraggoods/general/blocs/user_cubit/user_cubit.dart';
import 'package:heraggoods/general/constants/GlobalState.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/models/CategoryModel.dart';
import 'package:heraggoods/general/models/SettingModel.dart';
import 'package:heraggoods/general/models/SocialModel.dart';
import 'package:heraggoods/general/models/TabModel.dart';
import 'package:heraggoods/general/models/UserModel.dart';
import 'package:heraggoods/general/screens/splash/cats_cubit/cats_cubit.dart';
import 'package:heraggoods/general/screens/splash/tabs_cubit/tabs_cubit.dart';
import 'package:heraggoods/general/utilities/dio_helper/DioImports.dart';
import 'package:heraggoods/general/utilities/moor_db/db.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralHttpMethods {
  BuildContext context;
  GeneralHttpMethods({required this.context});
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<bool> userLogin(String phone, String pass) async {
    var token = await _firebaseMessaging.getToken();
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "phone": phone,
      "password": pass,
      "lang": lang,
      "deviceId": "$token",
      "deviceType": Platform.isIOS ? "ios" : 'android',
      "projectName": "سلع"
    };
    var data = await DioHelper(context: context).get("/api/v1/login", body);
    if (data != null) {
      await Utils.setDeviceId(token!);
      UserModel user = UserModel.fromJson(data["data"]);
      GlobalState.instance.set("token", user.token);
      await Utils.saveUserData(user);
      Utils.setCurrentUserData(user, context);

      return true;
    } else {
      return false;
    }
  }

  Future<void> getHomeConstData() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangBloc>().state.lang,
    };
    var data = await DioHelper(forceRefresh: false, context: context)
        .get("/api/v1/ListAllCatAndSideMnueAsync", body);
    if (data != null) {
      List<TabModel> tabs = List<TabModel>.from(
          data["data"]["listPage"].map((e) => TabModel.fromJson(e)));
      context.read<TabsCubit>().onSetTabsData(tabs);
      List<CategoryModel> cats = List<CategoryModel>.from(
          data["data"]["listCat"].map((e) => CategoryModel.fromJson(e)));
      cats.insert(
          0,
          CategoryModel(
              id: 0,
              name: "الكل",
              selected: true,
              list: [],
              isActive: true,
              img: "",
              parentId: 0,
              showSideManu: false));
      context.read<CatsCubit>().onSetCatsData(cats);
    }
  }

  Future<int> checkDeviceUpdated() async {
    var token = await _firebaseMessaging.getToken();
    Map<String, dynamic> body = {
      "deviceId": "$token",
      "lang": context.read<LangBloc>().state.lang,
    };
    var data = await DioHelper(context: context)
        .get("/api/v1/CheckDeviceUpdate", body);
    if (data != null) {
      List<TabModel> tabs = List<TabModel>.from(
          data["listPage"].map((e) => TabModel.fromJson(e)));
      context.read<TabsCubit>().onSetTabsData(tabs);
      return data["data"];
    } else {
      return 0;
    }
  }

  Future<Map<String, dynamic>> checkActive(String phone) async {
    var token = await _firebaseMessaging.getToken();
    Map<String, dynamic> body = {
      "phone": phone,
      "deviceId": "$token",
    };
    var data =
        await DioHelper(context: context).get("/api/v1/checkActive", body);
    if (data != null) {
      List<TabModel> tabs = List<TabModel>.from(
          data["listPage"].map((e) => TabModel.fromJson(e)));
      context.read<TabsCubit>().onSetTabsData(tabs);

      return data;
    } else {
      return {};
    }
  }

  Future<void> getAllCategories() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangBloc>().state.lang,
    };
    var data = await DioHelper(forceRefresh: false, context: context)
        .get("/api/v1/ListAllCat", body);
    if (data != null) {
      List<TabModel> tabs = List<TabModel>.from(
          data["listPage"].map((e) => TabModel.fromJson(e)));
      context.read<TabsCubit>().onSetTabsData(tabs);
      List<Category> cats =
          List<Category>.from(data["data"].map((e) => Category.fromJson(e)));
      cats.insert(
          0,
          Category(
              id: 0,
              name: "الرئيسية",
              img: "",
              parentId: 0,
              selected: true,
              showSideManu: false,
              idU: 0));
      context.read<MyDatabase>().updateAllCats(cats);
    }
  }

  Future<String> aboutApp(int pageId, bool refresh) async {
    Map<String, dynamic> body = {
      "lang": context.read<LangBloc>().state.lang,
      "pageId": "$pageId"
    };
    var data = await DioHelper(context: context, forceRefresh: refresh)
        .get("/api/v1/GetPagesContentAsync", body);
    if (data != null) {
      return data["data"];
    } else {
      return "";
    }
  }

  Future<String> terms() async {
    Map<String, dynamic> body = {
      "lang": context.watch<LangBloc>().state.lang,
    };
    var data = await DioHelper(context: context, forceRefresh: false)
        .get("/api/v1/Condtions", body);
    if (data != null) {
      return data["data"]["text"];
    } else {
      return "";
    }
  }

  Future<SocialModel> contactUs() async {
    Map<String, dynamic> body = {
      "lang": "${GlobalState.instance.get("lang")}",
    };
    var data = await DioHelper(context: context).get("Client/GetSeting", body);
    if (data != null) {
      return SocialModel.fromJson(data["setting"]);
    } else {
      return SocialModel(
          email: '',
          emailChat: '',
          facebook: '',
          instgram: '',
          linkedin: '',
          location: '',
          phone: '',
          twitter: '',
          whatsapp: '');
    }
  }

  Future<bool> switchNotify() async {
    Map<String, dynamic> body = {
      "lang": "${GlobalState.instance.get("lang")}",
      "user_id": "${GlobalState.instance.get("user_id")}",
    };
    var data =
        await DioHelper(context: context).post("Client/SwitchNotify", body);
    if (data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> forgetPassword(String phone) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "phone": phone,
      "lang": lang,
    };
    var data =
        await DioHelper(context: context).get("/api/v1/Forget_password", body);
    if (data != null) {
      AutoRouter.of(context)
          .push(ResetPasswordRoute(userId: "${data["code"]["user_id"]}"));

      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetUserPassword(
      String userId, String code, String pass) async {
    String lang = context.read<LangBloc>().state.lang;
    Map<String, dynamic> body = {
      "userId": userId,
      "code": code,
      "newPassword": pass,
      "lang": lang,
    };
    var data = await DioHelper(context: context)
        .get("/api/v1/ChangePasswordByCode", body);
    if (data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<SettingModel> getSettings({String lang = "ar"}) async {
    Map<String, dynamic> body = {"lang": lang};
    var data = await DioHelper(context: context).get("Client/GetSeting", body);
    if (data != null) {
      return SettingModel.fromJson(data["data"]);
    } else {
      return SettingModel(
        address: "",
      );
    }
  }

  Future<bool> sendMessage(String name, String mail, String message) async {
    Map<String, dynamic> body = {
      "lang": "${GlobalState.instance.get("lang")}",
      "name": name,
      "email": mail,
      "text": message,
    };
    var data = await DioHelper(context: context).post("Client/Complaint", body);
    if (data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    LoadingDialog.showLoadingDialog();
    var token = await _firebaseMessaging.getToken();
    Map<String, dynamic> body = {
      "lang": context.read<LangBloc>().state.lang,
      "user_id": context.read<UserCubit>().state.model.id,
      "device_id": token
    };
    debugPrint(body.toString());
    await DioHelper(context: context).get("/api/v1/logout", body);
    EasyLoading.dismiss().then((value) {
      Utils.clearSavedData();
      AutoRouter.of(context).replaceAll([const LoginRoute()]);
    });
  }
}
