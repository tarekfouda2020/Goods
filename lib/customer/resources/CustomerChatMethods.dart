// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/ChatModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heraggoods/customer/models/MessageModel.dart';
import 'package:heraggoods/general/blocs/chat_count_cubit/chat_count_cubit.dart';
import 'package:heraggoods/general/blocs/lang_bloc/lang_bloc.dart';
import 'package:heraggoods/general/blocs/user_cubit/user_cubit.dart';
import 'package:heraggoods/general/models/UserModel.dart';
import 'package:heraggoods/general/utilities/dio_helper/DioImports.dart';

class CustomerChatMethods{
  final BuildContext context;

  CustomerChatMethods(this.context);

  Future<List<ChatModel>> getListChatUsers(bool refresh)async{
    String lang=context.read<LangBloc>().state.lang;
    UserModel user=context.read<UserCubit>().state.model;
    Map<String,dynamic> body={
      "lang":lang,
      "UserId":user.id
    };
    var data = await DioHelper(forceRefresh: refresh, context: context).get("/api/v1/ListUsersMyChat", body);
    if(data!=null){
      return List<ChatModel>.from(data["data"].map((e) => ChatModel.fromJson(e)));
    }else{
      return [];
    }
  }

  Future<List<MessageModel>> getListChatMessages(String ReceiverId,int page)async{
    String lang=context.read<LangBloc>().state.lang;
    UserModel user=context.read<UserCubit>().state.model;
    Map<String,dynamic> body={
      "lang":lang,
      "ReceiverId":ReceiverId,
      "SenderId":user.id
    };
    var data = await DioHelper(forceRefresh: true, context: context).get("/api/v1/GetAllMessageBetweenTwoUser", body);
    if(data!=null){
      context.read<ChatCountCubit>().onUpdateCount(data["countChat"]??0);
      return List<MessageModel>.from(data["data"].map((e) => MessageModel.fromJson(e)));
    }else{
      return [];
    }
  }

  Future<bool> addUserReport(String id,String reason)async{
    String lang = context.read<LangBloc>().state.lang;
    Map<String,dynamic> body={
      "lang":lang,
      "fkUser":id,
      "reason":reason
    };
    var data = await DioHelper(context: context).post("/api/v1/AddReporToUser", body);
    return (data!=null);
  }

}