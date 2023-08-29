// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/models/AdsDataModel.dart';
import 'package:heraggoods/customer/models/DropDownModel.dart';
import 'package:heraggoods/customer/models/Dtos/UpdateAdModel.dart';
import 'package:heraggoods/customer/models/Dtos/LocationModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/customer/screens/location_address/location_cubit/location_cubit.dart';
import 'package:heraggoods/general/blocs/generic_cubit/generic_cubit.dart';
import 'package:heraggoods/general/constants/Inputs/DropdownTextField.dart';
import 'package:heraggoods/general/constants/Inputs/InkWellTextField.dart';
import 'package:heraggoods/general/constants/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/MyText.dart';

part 'EditOfferLocation.dart';
part 'EditOfferLocData.dart';
