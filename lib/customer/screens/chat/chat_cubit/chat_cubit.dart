import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../models/MessageModel.dart';
import '../../../resources/CustomerRepository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  onUpdateMessages(List<MessageModel> messages) {
    emit(ChatUpdated(messages, !state.changed));
  }

  fetchData(BuildContext context, String userId) async {
    List<MessageModel> messages =
        await CustomerRepository(context).getListChatMessages(userId, 1);
    onUpdateMessages(messages.reversed.toList());
  }
}
