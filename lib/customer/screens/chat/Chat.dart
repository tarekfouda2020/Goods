// ignore_for_file: library_private_types_in_public_api, file_names

part of 'ChatImports.dart';

class Chat extends StatefulWidget {
  final String senderId;
  final String receiverId;
  final String userName;

  const Chat(
      {super.key,
      required this.senderId,
      required this.receiverId,
      required this.userName});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> with ChatData {
  @override
  void initState() {
    chatCubit.fetchData(context, widget.receiverId);
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        detachedCallBack: () async => _hubConnection
            .invoke("DisConnect", args: <Object>[(widget.senderId), 1]),
        resumeCallBack: () => connectToServer(widget.senderId),
      ),
    );
    setConnectServer(widget.senderId, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model;
    return Scaffold(
      appBar: DefaultAppBar(
        title: widget.userName,
        onTitleClick: () => AutoRouter.of(context).push(
          UserProductsRoute(
              userId: widget.receiverId, userName: widget.userName),
        ),
        con: context,
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline_rounded,
              size: 25,
              color: MyColors.white,
            ),
            onPressed: () => _buildAddReportDialog(),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [_buildChatMessage(user), _buildChatInput()],
        ),
      ),
    );
  }

  Widget _buildChatMessage(UserModel user) {
    return BlocBuilder<ChatCubit, ChatState>(
      bloc: chatCubit,
      builder: (context, state) {
        return Flexible(
            child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 10),
          itemCount: state.messages.length,
          reverse: true,
          itemBuilder: (context, index) {
            if (state is ChatUpdated) {
              if (user.id == state.messages[index].senderId) {
                return _buildRightMsg(state.messages[index], user);
              } else {
                return _buildLeftMsg(state.messages[index]);
              }
            } else {
              return Expanded(
                child: Center(
                  child: LoadingDialog.showLoadingView(),
                ),
              );
            }
          },
        ));
      },
    );
  }

  Widget _buildRightMsg(MessageModel model, UserModel user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: user.userName ?? "",
            size: 10,
            color: MyColors.blackOpacity,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              minHeight: 30,
              maxWidth: MediaQuery.of(context).size.width * .7,
              minWidth: MediaQuery.of(context).size.width * .4,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              decoration: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
              child: SelectableText(
                model.message,
                style: GoogleFonts.cairo(fontSize: 12, color: MyColors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLeftMsg(MessageModel model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => AutoRouter.of(context).push(UserProductsRoute(
                userId: model.senderId, userName: widget.userName)),
            child: MyText(
              title: widget.userName,
              size: 11,
              color: MyColors.primary,
              decoration: TextDecoration.underline,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              minHeight: 30,
              maxWidth: MediaQuery.of(context).size.width * .7,
              minWidth: MediaQuery.of(context).size.width * .4,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              decoration: BoxDecoration(
                  color: MyColors.greyWhite,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
              child: SelectableText(
                model.message,
                style: GoogleFonts.cairo(
                  fontSize: 12,
                  color: MyColors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChatInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ChatTextField(
        controller: _msg,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        label: tr("writeMsg"),
        action: TextInputAction.newline,
        submit: () =>
            sendChatMessage(widget.receiverId, widget.senderId, context),
      ),
    );
  }

  void _buildAddReportDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          title: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: tr("report"),
                  size: 12,
                  color: Colors.white,
                ),
                InkWell(
                  child: const Icon(
                    Icons.close,
                    size: 25,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context).pop(),
                )
              ],
            ),
          ),
          content: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: formKey,
                  child: RichTextFiled(
                    controller: report,
                    height: 100,
                    label: tr("writeReason"),
                    max: 10,
                    min: 6,
                    submit: (value) => setAddReport(context, widget.receiverId),
                    validate: (value) => value.validateEmpty(context),
                  ),
                ),
                DefaultButton(
                    title: tr("send"),
                    onTap: () => setAddReport(context, widget.receiverId))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    _hubConnection
        // ignore: unnecessary_string_interpolations
        .invoke("DisConnectOnline", args: <Object>["${widget.senderId}", 1]);
  }

  @override
  void dispose() {
    super.dispose();
    _hubConnection
        .invoke("DisConnectOnline", args: <Object>[(widget.senderId), 1]);
  }
}
