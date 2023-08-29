// ignore_for_file: deprecated_member_use, file_names

part of 'MainDataImports.dart';

class MainData {
  static String baseUrl = "https://api.goods99.net";
  static String chatUrl = "$baseUrl/chatHub";

  static ThemeData defaultThem = ThemeData(
    primarySwatch: Colors.grey,
    focusColor: MyColors.primary,
    accentColor: MyColors.primary,
    primaryColor: MyColors.primary,
    platform: TargetPlatform.android,
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: TextTheme(
      subtitle1: GoogleFonts.cairo(
        fontSize: 14,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
  );

  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<LangBloc>(
          create: (BuildContext context) => LangBloc(),
        ),
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(),
        ),
        BlocProvider<TabsCubit>(
          create: (BuildContext context) => TabsCubit(),
        ),
        BlocProvider<CatsCubit>(
          create: (BuildContext context) => CatsCubit(),
        ),
        BlocProvider<LocationCubit>(
          create: (BuildContext context) => LocationCubit(),
        ),
        BlocProvider<WishListCubit>(
          create: (BuildContext context) => WishListCubit(),
        ),
        BlocProvider<OfferHeadersCubit>(
          create: (BuildContext context) => OfferHeadersCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<ChatCountCubit>(
          create: (BuildContext context) => ChatCountCubit(),
        ),
        BlocProvider<NotifyCountCubit>(
          create: (BuildContext context) => NotifyCountCubit(),
        ),
        BlocProvider<ShowPayCubit>(
          create: (BuildContext context) => ShowPayCubit(),
        ),
      ];
}
