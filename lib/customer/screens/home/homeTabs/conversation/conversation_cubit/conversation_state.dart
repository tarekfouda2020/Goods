part of 'conversation_cubit.dart';

abstract class ConversationState extends Equatable {
  final List<ChatModel> lst;
  final bool changed;
  const ConversationState(this.lst,this.changed);
}

class ConversationInitial extends ConversationState {
  ConversationInitial() : super([], false);

  @override
  List<Object> get props => [lst,changed];
}

class ConversationUpdated extends ConversationState {
  const ConversationUpdated(List<ChatModel> lst, bool changed) : super(lst, changed);

  @override
  List<Object> get props => [lst,changed];
}
