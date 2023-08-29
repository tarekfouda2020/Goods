// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/general/blocs/auth_cubit/auth_cubit.dart';
import 'package:heraggoods/general/blocs/generic_cubit/generic_cubit.dart';
import 'package:heraggoods/general/resources/GeneralRepository.dart';
import 'package:heraggoods/general/screens/login/login_cubit/login_cubit.dart';
import 'package:heraggoods/general/utilities/moor_db/db.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/general/constants/Inputs/LabelTextField.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/HeaderLogo.dart';
import 'package:heraggoods/general/widgets/MyText.dart';

part 'Login.dart';
part 'LoginData.dart';