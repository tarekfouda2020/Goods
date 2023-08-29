// ignore_for_file: file_names

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/models/Dtos/BottomTabModel.dart';
import 'package:heraggoods/customer/widgets/ChatIcon.dart';
import 'package:heraggoods/customer/widgets/EndDrawer.dart';
import 'package:heraggoods/customer/widgets/NotifyIcon.dart';
import 'package:heraggoods/customer/widgets/StartDrawer.dart';
import 'package:heraggoods/general/blocs/auth_cubit/auth_cubit.dart';
import 'package:heraggoods/general/constants/GlobalNotification.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/widgets/MyText.dart';
import '../../../general/blocs/user_cubit/user_cubit.dart';
import 'home_tab_cubit/home_tab_cubit.dart';
import 'homeTabs/favourite/FavouriteImports.dart';
import 'homeTabs/notifications/NotificationImports.dart';
import 'homeTabs/home_main/HomeMainImports.dart';
import 'homeTabs/conversation/ConversationImports.dart';




part 'Home.dart';
part 'HomeData.dart';