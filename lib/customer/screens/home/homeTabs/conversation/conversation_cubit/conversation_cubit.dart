import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:heraggoods/customer/models/ChatModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';

part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState> {
  ConversationCubit() : super(ConversationInitial());


  onUpdateDataList(List<ChatModel> lst){
    emit(ConversationUpdated(lst, !state.changed));
  }

  void fetchData(BuildContext context,{bool refresh = true})async{
    List<ChatModel> lst = await CustomerRepository(context).getListChatUsers(refresh);
    onUpdateDataList(lst);
  }

}
