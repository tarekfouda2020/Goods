// ignore_for_file: file_names

import 'package:heraggoods/general/models/SettingModel.dart';
import 'package:heraggoods/general/models/SocialModel.dart';
import 'package:flutter/material.dart';
import 'GeneralHttpMethods.dart';

class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;
  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = GeneralHttpMethods(context: _context);
  }

  Future<bool> setUserLogin(String phone, String pass) =>
      _generalHttpMethods.userLogin(phone, pass);

  Future<void> getHomeConstData() => _generalHttpMethods.getHomeConstData();

  Future<void> getAllCategories() => _generalHttpMethods.getAllCategories();
  Future<int> checkDeviceUpdated() => _generalHttpMethods.checkDeviceUpdated();

  Future<Map<String, dynamic>> checkActive(String phone) =>
      _generalHttpMethods.checkActive(phone);

  Future<String> aboutApp(int pageId, bool refresh) =>
      _generalHttpMethods.aboutApp(pageId, refresh);

  Future<String> terms() => _generalHttpMethods.terms();

  Future<SocialModel> contactUs() => _generalHttpMethods.contactUs();

  Future<bool> switchNotify() => _generalHttpMethods.switchNotify();

  Future<bool> forgetPassword(String phone) =>
      _generalHttpMethods.forgetPassword(phone);

  Future<bool> resetUserPassword(String userId, String code, String pass) =>
      _generalHttpMethods.resetUserPassword(userId, code, pass);

  Future<SettingModel> getSettings() => _generalHttpMethods.getSettings();

  Future<bool> sendMessage(String name, String mail, String message) =>
      _generalHttpMethods.sendMessage(name, mail, message);

  Future<void> logout() => _generalHttpMethods.logout();
}
