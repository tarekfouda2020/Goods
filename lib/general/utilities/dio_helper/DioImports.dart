// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/general/constants/GlobalState.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tf_dio_cache/dio_http_cache.dart';

part 'DioHelper.dart';
