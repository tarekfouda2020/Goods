// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:heraggoods/customer/models/NotifyModel.dart';
import 'package:heraggoods/customer/screens/home/homeTabs/home_main/HomeMainImports.dart';
import 'package:heraggoods/customer/widgets/pull_refresher/CustomPullRefresh.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/MyText.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'notify_cubit/notify_cubit.dart';

part 'Notifications.dart';
part 'NotificationsData.dart';
