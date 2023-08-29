// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:heraggoods/customer/models/AdsModel.dart';
import 'package:heraggoods/customer/models/Dtos/FilterModel.dart';
import 'package:heraggoods/customer/models/Dtos/LocationModel.dart';
import 'package:heraggoods/customer/models/Dtos/MarkersModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/customer/screens/home/homeTabs/home_main/HomeMainImports.dart';
import 'package:heraggoods/general/blocs/generic_cubit/generic_cubit.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/widgets/MyText.dart';


part 'FilterLocation.dart';
part 'FilterLocationData.dart';