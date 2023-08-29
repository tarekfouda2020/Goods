// @dart=2.9
// ignore_for_file: library_private_types_in_public_api, unused_local_variable
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:signalr_core/signalr_core.dart';
import 'general/utilities/main_data/MainDataImports.dart';
import 'general/utilities/moor_db/db.dart';
import 'general/utilities/routers/RouterImports.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
      path: 'assets/langs',
      fallbackLocale: const Locale('ar', 'EG'),
      startLocale: const Locale('ar', 'EG'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MultiBlocProvider(
      providers: MainData.providers(context),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => MyDatabase()),
          RepositoryProvider(create: (context) => HubConnectionBuilder())
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "سلع",
          theme: MainData.defaultThem,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerDelegate: _appRouter.delegate(
            initialRoutes: [const SplashRoute()],
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          builder: (ctx, child) {
            child = FlutterEasyLoading(child: child); //do something
            return child;
          },
        ),
      ),
    );
  }
}
