// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:heraggoods/customer/models/AdsModel.dart';
import 'package:heraggoods/customer/models/EditAdModel.dart';
import 'package:heraggoods/customer/widgets/ProductRow.dart';
import 'package:heraggoods/customer/widgets/pull_refresher/CustomPullRefresh.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/models/UserModel.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/MyText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/screens/my_products/my_ads_cubit/my_ads_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'MyProducts.dart';
part 'MyProductsData.dart';


