// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../customer/models/AdsModel.dart';
import '../utilities/moor_db/db.dart';
import '../utilities/routers/RouterImports.gr.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void requestPermissions() {
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();
}

void showNotification(RemoteMessage event, String payload) async {
  var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    "sa.aait.flutter.dbikes",
    "D-Bikes",
    channelDescription: "notificationBase",
    enableVibration: true,
    playSound: true,
    icon: "logo",
    importance: Importance.high,
    priority: Priority.high,
  );
  var notificationDetails = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );
  String title = "${event.notification?.title}";
  String body = "${event.notification?.body}";
  await flutterLocalNotificationsPlugin.show(
    200,
    title,
    body,
    notificationDetails,
    payload: payload,
  );
}

void initLocalNotification(BuildContext context) async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("logo");

  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (String? payload) =>
        flutterNotificationClick(payload, context),
  );
}

Future<void> registerNotification() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
}

void initializeFlutterFire() async => await registerNotification();

Future flutterNotificationClick(String? payload, BuildContext context) async {
  debugPrint("tttttttttt $payload");
  if (payload == null) {
    return;
  }
  var _data = json.decode(payload);
  int _type = int.parse(_data["type"] ?? "4");
  if (_type >= 1 && _type <= 4) {
    var adInfo = json.decode(_data["ads_info"]);
    AdsModel model = AdsModel.fromJson(adInfo);
    context.router.push(ProductDetailsRoute(model: model));
  } else if (_type == 5 || _type == 6 || _type == 8) {
    context.router.push(UserProductsRoute(
        userId: _data["user_id"], userName: _data["user_name"]));
  } else if (_type == 9) {
    context.router.push(ChatRoute(
        userName: _data["userName"],
        receiverId: _data["receiverId"],
        senderId: _data["senderId"]));
  } else if (_type == 7) {
    int parentCount =
        (await context.read<MyDatabase>().selectParentCatsAsync()).length;
    context.router.push(HomeRoute(parentCount: parentCount, tab: 2));
  }
}

void saveFcmToken() async {
  var token = await FirebaseMessaging.instance.getToken();
  log("Firebase Fcm token : ${token.toString()}");
}

void setupNotifications(BuildContext context) {
  context = context;
  saveFcmToken();
  initializeFlutterFire();
  initLocalNotification(context);
  requestPermissions();
  FirebaseMessaging.onBackgroundMessage(((message) async {
    await Firebase.initializeApp();
    if (message.data['type'] == '-1') {
      AutoRouter.of(context).replaceAll(const [LoginRoute()]);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
    }
  }));
  FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
    if (event.data != {}) {
      showNotification(event, "${event.data}");
    } else {
      showNotification(event, "${event.notification}");
    }
    if (event.data['type'] == '-1') {
      AutoRouter.of(context).replaceAll([const LoginRoute()]);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
    flutterNotificationClick(event.data.toString(), context);
  });
  log("Notifications init complete");
}
