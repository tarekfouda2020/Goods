part of 'chat_count_cubit.dart';

abstract class ChatCountState extends Equatable {
  final int count;
  const ChatCountState(this.count);
}

class ChatCountInitial extends ChatCountState {
  const ChatCountInitial() : super(0);

  @override
  List<Object> get props => [count];
}

class ChatCountUpdate extends ChatCountState {
  const ChatCountUpdate(int count) : super(count);

  @override
  List<Object> get props => [count];
}
