// ignore_for_file: unused_element, avoid_print, use_build_context_synchronously, file_names

part of 'ChatImports.dart';

class ChatData {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _msg = TextEditingController();
  final TextEditingController report = TextEditingController();
  final ChatCubit chatCubit = ChatCubit();
  late HubConnection _hubConnection;
  int count = 0;

  void setConnectServer(String userId, BuildContext context) async {
     _hubConnection =
        context.read<HubConnectionBuilder>().withUrl(MainData.chatUrl).build();
    await _hubConnection.start();
    _hubConnection.onclose((error) => print("error when connect"));
    _hubConnection.on("receiveMessage", _handleIncomingChatMessage);
    _hubConnection.on("connected", _handleConnectedUsers);
     connectToServer(userId);
  }

  void connectToServer(String userId) async {
    List<Object> args = [userId];
    print("Connecting");
    await _hubConnection.invoke("Connect", args: args);
    print("Connecting Success");
  }

  void _handleConnectedUsers(List<dynamic>? args) {
    print("_____________________${args![0]}");
  }

  void _handleDisConnectedUser(List<Object> args) {
    print(args[0]);
  }

  void _handleIncomingChatMessage(List<dynamic>? args) {
    print(args);
    MessageModel msg = MessageModel.fromJson(args![0]);
    _updateAndMoveDown(msg);
  }

  void _updateAndMoveDown(MessageModel msg) {
    chatCubit.state.messages.insert(0, msg);
    chatCubit.onUpdateMessages(chatCubit.state.messages);
    // itemScrollController.jumpTo(index: chatCubit.state.messages.length-1);
  }

  void sendChatMessage(
      String receiverID, String userId, BuildContext context) async {
    if (_msg.text.trim().isEmpty) {
      return;
    }
    MessageModel msg = MessageModel(
      date: "",
      id: chatCubit.state.messages.length,
      message: _msg.text,
      receiverId: receiverID,
      senderId: userId,
    );
    List<Object> args = [
      userId,
      receiverID,
      (_msg.text),
    ];
    await _hubConnection.invoke("SendMessage", args: args);
    _msg.text = "";
    _updateAndMoveDown(msg);
  }

  void setAddReport(BuildContext context, String id) async {
    if (formKey.currentState!.validate()) {
      var result =
          await CustomerRepository(context).addUserReport(id, report.text);
      if (result) {
        report.text = "";
        AutoRouter.of(context).pop();
      }
    }
  }
}
