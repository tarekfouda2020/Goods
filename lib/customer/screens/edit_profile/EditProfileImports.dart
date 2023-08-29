// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/models/Dtos/LocationModel.dart';
import 'package:heraggoods/customer/models/Dtos/UpdateProfileModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/customer/screens/edit_profile/profile_cover_cubit/profile_cover_cubit.dart';
import 'package:heraggoods/customer/screens/location_address/location_cubit/location_cubit.dart';
import 'package:heraggoods/general/constants/Inputs/InkWellTextField.dart';
import 'package:heraggoods/general/constants/Inputs/LabelTextField.dart';
import 'package:heraggoods/general/constants/Inputs/RichTextFiled.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/models/UserModel.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'profile_image_cubit/profile_image_cubit.dart';

part 'EditProfileData.dart';
part 'EditProfile.dart';
