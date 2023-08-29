import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_count_state.dart';

class ChatCountCubit extends Cubit<ChatCountState> {
  ChatCountCubit() : super(const ChatCountInitial());

  onUpdateCount(int count){
    emit(ChatCountUpdate(count));
  }
}
