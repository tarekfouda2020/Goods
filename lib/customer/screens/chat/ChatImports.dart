// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heraggoods/general/widgets/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../general/blocs/user_cubit/user_cubit.dart';
import '../../../general/constants/Inputs/ChatTextField.dart';
import '../../../general/constants/Inputs/RichTextFiled.dart';
import '../../../general/constants/ModaLs/LoadingDialog.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/UserModel.dart';
import '../../../general/utilities/main_data/MainDataImports.dart';
import '../../../general/utilities/routers/RouterImports.gr.dart';
import '../../../general/utilities/utils_functions/LifecycleEventHandler.dart';
import '../../../general/widgets/DefaultAppBar.dart';
import '../../../general/widgets/DefaultButton.dart';
import '../../../general/widgets/MyText.dart';
import '../../models/MessageModel.dart';
import '../../resources/CustomerRepository.dart';
import 'chat_cubit/chat_cubit.dart';

part 'Chat.dart';
part 'ChatData.dart';
