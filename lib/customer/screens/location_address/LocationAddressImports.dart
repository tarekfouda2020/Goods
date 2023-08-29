// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heraggoods/customer/models/Dtos/LocationModel.dart';
import 'package:heraggoods/customer/screens/location_address/location_cubit/location_cubit.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/widgets/MyText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'LocationAddress.dart';
part 'LocationAddressData.dart';
