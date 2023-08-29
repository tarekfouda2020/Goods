// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:heraggoods/customer/models/AdOwnerModel.dart';
import 'package:heraggoods/customer/models/AdsModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/customer/widgets/ProductRow.dart';
import 'package:heraggoods/customer/widgets/TitleButton.dart';
import 'package:heraggoods/customer/widgets/pull_refresher/CustomPullRefresh.dart';
import 'package:heraggoods/general/blocs/auth_cubit/auth_cubit.dart';
import 'package:heraggoods/general/blocs/user_cubit/user_cubit.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/models/UserModel.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/widgets/CachedImage.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/MyText.dart';
import 'package:heraggoods/customer/screens/user_products/user_ads_cubit/user_ads_cubit.dart';
import 'package:heraggoods/customer/screens/user_products/rate_user_cubit/rate_user_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'ad_owner_cubit/add_owner_cubit.dart';



part 'UserProductsData.dart';
part 'UserProducts.dart';