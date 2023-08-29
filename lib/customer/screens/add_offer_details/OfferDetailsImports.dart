// ignore_for_file: file_names

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heraggoods/customer/models/DropDownModel.dart';
import 'package:heraggoods/customer/models/Dtos/AddAdsModel.dart';
import 'package:heraggoods/customer/models/SpecificationHeaderModel.dart';
import 'package:heraggoods/customer/models/SpecificationModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/customer/screens/add_offer_details/cats_inputs_cubit/cats_inputs_cubit.dart';
import 'package:heraggoods/customer/screens/add_offer_details/group_cubit/group_cubit.dart';
import 'package:heraggoods/customer/screens/add_offer_details/header_cubit/header_cubit.dart';
import 'package:heraggoods/general/blocs/generic_cubit/generic_cubit.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:heraggoods/general/constants/Inputs/DropdownTextField.dart';
import 'package:heraggoods/general/constants/Inputs/InkWellTextField.dart';
import 'package:heraggoods/general/constants/Inputs/LabelTextField.dart';
import 'package:heraggoods/general/constants/Inputs/RichTextFiled.dart';
import 'package:heraggoods/general/constants/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/moor_db/db.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/MyText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/models/SpecificationGroupModel.dart';
import 'package:heraggoods/customer/screens/add_offer_details/desc_cubit/desc_cubit.dart';
import 'package:heraggoods/customer/models/Dtos/CatPropertyModel.dart';
import 'package:heraggoods/customer/models/PropertyModel.dart';
import 'package:heraggoods/customer/screens/add_offer_details/ads_phone_cubit/ads_phone_cubit.dart';
import 'dart:convert';


part 'OfferDetailsData.dart';
part 'AddOfferDetails.dart';