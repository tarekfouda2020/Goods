// ignore_for_file: file_names, use_build_context_synchronously

part of 'ConversationImports.dart';

class ConversationData {
  final ConversationCubit conversationCubit = ConversationCubit();

  navigateToChat(BuildContext context, ChatModel model, UserModel user) async {
    await AutoRouter.of(context).push(ChatRoute(
        senderId: user.id!, receiverId: model.userId, userName: model.userName));

    conversationCubit.fetchData(context);
  }
}
