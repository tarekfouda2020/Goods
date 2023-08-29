// ignore_for_file: file_names

import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/models/AdsDataModel.dart';
import 'package:heraggoods/customer/models/Dtos/UpdateAdModel.dart';
 import 'package:heraggoods/customer/screens/edit_offer_images/edit_images_cubit/edit_images_cubit.dart';
import 'package:heraggoods/customer/screens/edit_offer_images/exist_image_cubit/exist_image_cubit.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';
import 'package:heraggoods/general/widgets/CachedImage.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/MyText.dart';

part 'EditImagesData.dart';
part 'EditOfferImages.dart';