// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/Dtos/LocationModel.dart';
import 'package:heraggoods/customer/screens/location_address/location_cubit/location_cubit.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/MyText.dart';
import 'package:heraggoods/res.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/utilities/moor_db/db.dart';
import '../../../general/utilities/routers/RouterImports.gr.dart';

part 'EditOfferSuccess.dart';