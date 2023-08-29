// ignore_for_file: file_names

import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/models/Dtos/AddAdsModel.dart';
import 'package:heraggoods/customer/models/OffersHeaderModel.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/MyText.dart';
import 'add_ads_images_cubit/add_ads_images_cubit.dart';


part 'AddImagesData.dart';
part 'AddOfferImages.dart';