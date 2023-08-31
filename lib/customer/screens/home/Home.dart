// ignore_for_file: library_private_types_in_public_api, file_names

part of 'HomeImports.dart';

class Home extends StatefulWidget {
  final int parentCount;
  final int tab;

  const Home({super.key, required this.parentCount, this.tab = 0});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin, HomeData {
  @override
  void initState() {
    initBottomNavigation(this);
    animateTabsPages(widget.tab, context);
    // NewVersion(
    //   context: context,
    //   iOSId: 'sa.aait.asp.herag.goods',
    //   androidId: 'sa.aait.asp.herag.goods',
    //   dialogText: "يمكنك التحديث الان للاستمتاع باجدد المميزات .",
    //   dialogTitle: "لديك تحديث جديد",
    //   dismissText: "التحديث لاحقا",
    //   updateText: "تحديث"
    // ).showAlertIfNecessary();
    setupNotifications(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          key: scaffold,
          extendBody: true,
          drawer: StartDrawer(scaffold: scaffold),
          endDrawer: EndDrawer(scaffold: scaffold),
          // endDrawer: Drawer(
          //   child: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         const Text('This is the Drawer'),
          //         ElevatedButton(
          //           onPressed: () => Navigator.of(context).pop(),
          //           child: const Text('Close Drawer'),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          endDrawerEnableOpenDragGesture: false,
          drawerEnableOpenDragGesture: false,
          body: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomeMain(
                scaffold: scaffold,
                parentCount: widget.parentCount,
              ),
              Favourite(scaffold: scaffold),
              Notifications(scaffold: scaffold),
              Conversations(scaffold: scaffold),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => addAddClick(context),
            backgroundColor: MyColors.primary,
            elevation: 0,
            child: Icon(
              Icons.add,
              size: 30,
              color: MyColors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BlocBuilder<HomeTabCubit, HomeTabState>(
            bloc: homeTabCubit,
            builder: (context, state) {
              return _buildBottomNavigationBar(state.current);
            },
          ),
        ),
      ),
      onWillPop: () => onBackPressed(context),
    );
  }

  Widget _buildBottomNavigationBar(int current) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: 4,
      tabBuilder: (int index, bool isActive) {
        return _buildTabIcon(index: index, active: isActive);
      },
      backgroundColor: MyColors.white,
      splashColor: MyColors.white,
      activeIndex: current,
      notchAndCornersAnimation: animation,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.center,
      leftCornerRadius: 20,
      rightCornerRadius: 20,
      height: 70,
      onTap: (index) => animateTabsPages(index, context),
    );
  }

  Widget _buildTabIcon({required int index, required bool active}) {
    Color color = active ? MyColors.primary : MyColors.blackOpacity;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: tabs[index].iconData == Icons.notifications &&
                context.read<AuthCubit>().state.authorized,
            replacement: Visibility(
              visible: tabs[index].iconData == Icons.mail_outline &&
                  context.read<AuthCubit>().state.authorized,
              replacement: Icon(
                tabs[index].iconData,
                size: 25,
                color: color,
              ),
              child: ChatIcon(color: color),
            ),
            child: NotifyIcon(color: color),
          ),
          MyText(
            title: tabs[index].title,
            size: 10,
            color: color,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    animationController.dispose();
    super.dispose();
  }
}
