// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/CommentModel.dart';
import 'package:heraggoods/customer/models/ReplyModel.dart';
import 'package:heraggoods/customer/screens/home/homeTabs/home_main/HomeMainImports.dart';
import 'package:heraggoods/general/blocs/user_cubit/user_cubit.dart';
import 'package:heraggoods/general/constants/Inputs/RichTextFiled.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/models/UserModel.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/MyText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'comment_cubit/comment_cubit.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';

part 'ProductComments.dart';
part 'ProductCommentsData.dart';
