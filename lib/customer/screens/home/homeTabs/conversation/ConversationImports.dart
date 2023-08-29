// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/models/ChatModel.dart';
import 'package:heraggoods/general/blocs/user_cubit/user_cubit.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/models/UserModel.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/widgets/CachedImage.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/MyText.dart';
import 'conversation_cubit/conversation_cubit.dart';

part 'Conversations.dart';
part 'ConversationData.dart';
