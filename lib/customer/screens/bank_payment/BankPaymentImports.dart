
// ignore_for_file: file_names

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/models/BankModel.dart';
import 'package:heraggoods/customer/models/Dtos/AddPayModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/customer/screens/bank_payment/pay_cubit/pay_cubit.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:heraggoods/general/constants/Inputs/DropdownTextField.dart';
import 'package:heraggoods/general/constants/Inputs/InkWellTextField.dart';
import 'package:heraggoods/general/constants/Inputs/LabelTextField.dart';
import 'package:heraggoods/general/constants/Inputs/RichTextFiled.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';


part 'BankPayment.dart';
part 'BankPaymentData.dart';