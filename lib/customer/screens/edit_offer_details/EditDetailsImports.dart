// ignore_for_file: file_names

import 'dart:io';
import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/models/AdsDataModel.dart';

import 'package:heraggoods/customer/models/Dtos/UpdateAdModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/customer/screens/edit_offer_location/map_reply_cubit/map_reply_cubit.dart';
import 'package:heraggoods/customer/screens/home/homeTabs/home_main/HomeMainImports.dart';
import 'package:heraggoods/general/blocs/generic_cubit/generic_cubit.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:heraggoods/general/constants/Inputs/InkWellTextField.dart';
import 'package:heraggoods/general/constants/Inputs/LabelTextField.dart';
import 'package:heraggoods/general/constants/Inputs/RichTextFiled.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/MyText.dart';





part 'EditDetailsData.dart';
part 'EditOfferDetails.dart';