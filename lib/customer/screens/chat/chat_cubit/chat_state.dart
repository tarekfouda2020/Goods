part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  final List<MessageModel> messages;
  final bool changed;
  const ChatState(this.messages,this.changed);
}

class ChatInitial extends ChatState {
  ChatInitial() : super([], false);

  @override
  List<Object> get props => [messages,changed];
}

class ChatUpdated extends ChatState {
  const ChatUpdated(List<MessageModel> messages, bool changed) : super(messages, changed);

  @override
  List<Object> get props => [messages,changed];
}
