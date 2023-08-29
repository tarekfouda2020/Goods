// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:heraggoods/customer/models/Dtos/LocationModel.dart';
import 'package:heraggoods/customer/screens/location_address/location_cubit/location_cubit.dart';
import 'package:heraggoods/general/blocs/auth_cubit/auth_cubit.dart';
import 'package:heraggoods/general/blocs/user_cubit/user_cubit.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/models/UserModel.dart';
import 'package:heraggoods/general/resources/GeneralRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heraggoods/general/utilities/moor_db/db.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:heraggoods/general/constants/GlobalState.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'utils.dart';
