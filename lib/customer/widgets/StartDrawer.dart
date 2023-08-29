// ignore_for_file: deprecated_member_use, avoid_function_literals_in_foreach_calls, file_names

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';

import '../../general/blocs/auth_cubit/auth_cubit.dart';
import '../../general/blocs/show_pay-cubit/show_pay_cubit.dart';
import '../../general/blocs/user_cubit/user_cubit.dart';
import '../../general/constants/ModaLs/LoadingDialog.dart';
import '../../general/constants/MyColors.dart';
import '../../general/models/TabModel.dart';
import '../../general/resources/GeneralRepository.dart';
import '../../general/screens/splash/tabs_cubit/tabs_cubit.dart';
import '../../general/utilities/routers/RouterImports.gr.dart';
import '../../general/widgets/MyText.dart';
import '../resources/CustomerRepository.dart';

class StartDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;

  const StartDrawer({super.key, required this.scaffold});

  @override
  State<StartDrawer> createState() => _StartDrawerState();
}

class _StartDrawerState extends State<StartDrawer> {
  @override
  Widget build(BuildContext context) {
    List<TabModel> tabs = context.watch<TabsCubit>().state.tabs;
    var user = context.watch<UserCubit>().state.model;
    return SafeArea(
      child: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          color: MyColors.greyWhite,
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: const EdgeInsets.all(0),
            children: [
              Offstage(
                offstage: !context.watch<AuthCubit>().state.authorized,
                child: Column(
                  children: [
                    _buildListViewItem(
                        color: Colors.white,
                        title: "اهلا ${user.userName}",
                        iconData: Icons.person,
                        onTap: () => AutoRouter.of(context)
                            .push(ProfileRoute(name: user.userName!))),
                    _buildListViewItem(
                        title: "اضف اعلانك",
                        iconData: FontAwesomeIcons.plus,
                        onTap: () => AutoRouter.of(context)
                            .push(const AddOffersRoute())),
                    _buildListViewItem(
                        title: "اعلاناتي",
                        iconData: FontAwesomeIcons.pager,
                        onTap: () => AutoRouter.of(context)
                            .push(const MyProductsRoute())),
                    _buildListViewItem(
                        title: "قائمة المتابعة",
                        iconData: FontAwesomeIcons.users,
                        onTap: () => AutoRouter.of(context)
                            .push(const FollowersRoute())),
                    Visibility(
                      visible: context.watch<ShowPayCubit>().state.show,
                      child: Column(
                        children: [
                          _buildListViewItem(
                              title: "الحسابات البنكية",
                              iconData: FontAwesomeIcons.idCard,
                              onTap: () => AutoRouter.of(context)
                                  .push(const AdminBanksRoute())),
                          _buildListViewItem(
                              title: "دفع العمولة",
                              iconData: FontAwesomeIcons.coins,
                              onTap: () => AutoRouter.of(context)
                                  .push(const BankPaymentRoute())),
                        ],
                      ),
                    ),
                    _buildListViewItem(
                        title: "تواصل معنا",
                        iconData: Icons.phone_enabled_rounded,
                        onTap: () =>
                            AutoRouter.of(context).push(const CallUsRoute())),
                    Divider(
                      color: MyColors.blackOpacity,
                      height: 20,
                      thickness: .5,
                    ),
                  ],
                ),
              ),
              // _buildListViewItem(
              //   title: tr("contactWithUs"),
              //   iconData: FontAwesomeIcons.phone,
              //   onTap: () => AutoRouter.of(context).push(const CallUsRoute()),
              // ),
              // Divider(
              //   color: MyColors.blackOpacity,
              //   height: 20,
              //   thickness: .5,
              // ),
              _buildTabsPages(tabs, context),
              Visibility(
                visible: context.watch<AuthCubit>().state.authorized,
                replacement: _buildListViewItem(
                  title: tr("login"),
                  iconData: FontAwesomeIcons.signInAlt,
                  textColor: Colors.red,
                  onTap: () => AutoRouter.of(context).pushAndPopUntil(
                      const LoginRoute(),
                      predicate: (b) => false),
                ),
                child: _buildListViewItem(
                    title: tr("logout"),
                    iconData: FontAwesomeIcons.signOutAlt,
                    textColor: Colors.red,
                    onTap: () => _showLogoutConfirm(context)),
              ),
              if (context.watch<AuthCubit>().state.authorized)
                _buildListViewItem(
                  title: tr("deleteAccount"),
                  iconData: FontAwesomeIcons.userAlt,
                  textColor: Colors.red,
                  onTap: () => _showDeleteAccountConfirm(context),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabsPages(List<TabModel> tabs, BuildContext context) {
    List<Widget> tabsList = [];
    tabs.forEach((element) {
      element.pages.forEach((page) {
        if (page.showInApp) {
          var finalImage;
          switch(page.name)
          {
            case "الاسئلة الشائعة": finalImage="assets/images/question-mark.png";
              break;
            case "من نحن": finalImage="assets/images/information-button.png";
            break;
            case "اتفاقية الاستخدام": finalImage="assets/images/agreement.png";
            break;
            case "الشروط والاحكام": finalImage="assets/images/terms.png";
            break;
            case "عن التطبيق": finalImage="assets/images/application.png";
            break;
            case "السلع والإعلانات الممنوعة": finalImage="assets/images/block.png";
            break;
            case "سداد عمولة الموقع": finalImage="assets/images/commissionn.png";
            break;
            default:finalImage="assets/images/general.png";
            break;

          }
          tabsList.add(
              _buildListViewItemP(
                title: context.watch<LangBloc>().state.lang == 'ar'
                    ? page.name
                    : page.nameEn,
                img: finalImage,
                onTap: () =>
                    AutoRouter.of(context).push(RemotePageRoute(page: page)),
              ),
              );
          //   _buildListViewItem(
          //     title: context.watch<LangBloc>().state.lang == 'ar'
          //         ? page.name
          //         : page.nameEn,
          //     iconData: Icons,
          //     onTap: () =>
          //         AutoRouter.of(context).push(RemotePageRoute(page: page)),
          //   ),
          // );
        }
      });
      tabsList.add(Divider(
        color: MyColors.blackOpacity,
        height: 20,
        thickness: .5,
      ));
    });
    return Column(
      children: tabsList,
    );
  }

  Widget _buildListViewItem(
      {Color? color,
      Color? textColor,
      required IconData iconData,
      required String title,
      required Function() onTap}) {
    return ListTile(
      focusColor: MyColors.primary,
      hoverColor: MyColors.primary,
      leading: Icon(
        iconData,
        size: 18,
        color: MyColors.greenColor,
      ),
      title: MyText(
        title: title,
        size: 10,
        // ignore: prefer_if_null_operators
        color: textColor != null ? textColor : MyColors.blackOpacity,
      ),
      onTap: onTap,
      tileColor: color ?? Colors.transparent,
    );
  }
  Widget _buildListViewItemP(
      {Color? color,
        Color? textColor,
        required String img,
        required String title,
        required Function() onTap}) {
    return ListTile(
      focusColor: MyColors.primary,
      hoverColor: MyColors.primary,
      leading: Image.asset(
        img,
        width: 20,
        height: 20,
        color: MyColors.greenColor,
      ),
      title: MyText(
        title: title,
        size: 10,
        // ignore: prefer_if_null_operators
        color: textColor != null ? textColor : MyColors.blackOpacity,
      ),
      onTap: onTap,
      tileColor: color ?? Colors.transparent,
    );
  }

  void _showLogoutConfirm(BuildContext context) {
    LoadingDialog.showConfirmDialog(
      context: context,
      title: tr("confirmLogout"),
      confirm: () {
        AutoRouter.of(context).pop();
        GeneralRepository(context).logout();
      },
    );
  }

  void _showDeleteAccountConfirm(BuildContext context) {
    LoadingDialog.showConfirmDialog(
      context: context,
      title: tr("deleteAccount"),
      confirm: () {
        AutoRouter.of(context).pop();
        CustomerRepository(context).removeAccount();
      },
    );
  }
}
