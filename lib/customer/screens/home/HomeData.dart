// ignore_for_file: file_names

part of 'HomeImports.dart';

class HomeData {
  final GlobalKey<ScaffoldState> scaffold = GlobalKey();
  final HomeTabCubit homeTabCubit = HomeTabCubit();
  late AnimationController animationController;
  late TabController tabController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  int currentIndex = 0;

  List<BottomTabModel> tabs = [
    BottomTabModel(iconData: Icons.home, title: "الرئيسية"),
    BottomTabModel(iconData: Icons.favorite, title: "المفضلة"),
    BottomTabModel(iconData: Icons.notifications, title: "الإشعارات"),
    BottomTabModel(iconData: Icons.mail_outline, title: "الرسائل"),
  ];

  void initBottomNavigation(TickerProvider ticker) {
    // final systemTheme = SystemUiOverlayStyle.light.copyWith(
    //   systemNavigationBarColor: MyColors.primary,
    //   systemNavigationBarIconBrightness: Brightness.light,
    // );
    // SystemChrome.setSystemUIOverlayStyle(systemTheme);

    tabController = TabController(length: 4, vsync: ticker);
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: ticker,
    );
    curve = CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(curve);

    Future.delayed(
      const Duration(seconds: 1),
      () => animationController.forward(),
    );
  }

  void animateTabsPages(int index, BuildContext context) {
    bool result = context.read<AuthCubit>().state.authorized;
    if (index != homeTabCubit.state.current) {
      if (result) {
        homeTabCubit.onUpdateTab(index);
        tabController.animateTo(index);
      } else {
        LoadingDialog.showAuthDialog(context: context);
      }
    }
  }

  void addAddClick(BuildContext context) {
    bool result = context.read<AuthCubit>().state.authorized;
    if (result) {
      AutoRouter.of(context).push(const AddOffersRoute());
    } else {
      LoadingDialog.showAuthDialog(context: context);
    }
  }

  Future<bool> onBackPressed(BuildContext context) async {
    LoadingDialog.showConfirmDialog(
      context: context,
      title: 'هل تريد الخروج',
      confirm: () => SystemNavigator.pop(),
    );
    return true;
  }
}
