// ignore_for_file: file_names, library_private_types_in_public_api

part of 'CallUsImports.dart';

class CallUs extends StatefulWidget {
  const CallUs({super.key});

  @override
  _CallUsState createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> with CallUsData {
  @override
  void initState() {
    callSocialCubit.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr("callUs"),
        con: context,
      ),
      key: _scaffold,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: const Image(
              height: 150,
              image: AssetImage(Res.logo),
              fit: BoxFit.contain,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                DropdownTextField<DropDownModel>(
                  label: tr('deptReason'),
                  dropKey: reason,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onChange: setSelectReason,
                  finData: (filter) async =>
                      await CustomerRepository(context).getContactReasons(),
                  validate: (value) =>
                      Validator().validateDropDown<DropDownModel>(model: value),
                ),
                LabelTextField(
                  label: tr("mail"), //"البريد",
                  type: TextInputType.emailAddress,
                  controller: email,
                  validate: (value) => Validator().validateEmail(value: value),
                ),
                RichTextFiled(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  label: tr("message"),
                  //"الرسالة",
                  type: TextInputType.multiline,
                  height: MediaQuery.of(context).size.height * .18,
                  max: 8,
                  controller: msg,
                  validate: (value) => Validator().validateEmpty(value: value),
                  action: TextInputAction.newline,
                ),
                BlocConsumer<CallImageCubit, CallImageState>(
                  bloc: callImageCubit,
                  listener: (_, state) {
                    callFile.text = state.file!.path.split("/").last;
                  },
                  builder: (_, state) {
                    return InkWellTextField(
                      controller: callFile,
                      label: tr("choseFile"),
                      type: TextInputType.text,
                      icon: const Icon(Icons.attach_file),
                      onTab: showFileTypeDialog,
                    );
                  },
                ),
                DefaultButton(
                  title: tr("send"), //"ارسال",
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  onTap: () => setContactUs(context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: MyText(
                    title: tr("orCallVia"),
                    color: MyColors.primary,
                  ),
                ),
                BlocBuilder<CallSocialCubit, CallSocialState>(
                  bloc: callSocialCubit,
                  builder: (_, state) {
                    if (state is CallSocialUpdate) {
                      return Column(
                        children: [
                          Offstage(
                            offstage: state.model!.address == null,
                            child: callUsItem(
                                icon: Icons.location_on,
                                content: state.model!.address ?? "",
                                onTap: () => state.model!.lat.isNotEmpty
                                    ? Utils.navigateToMapWithDirection(
                                        lat: state.model!.lat,
                                        lng: state.model!.lng,
                                        title: state.model!.address!)
                                    : null),
                          ),
                          callUsItem(
                              icon: Icons.mail,
                              content: state.model!.email,
                              onTap: () => Utils.sendMail(state.model!.email)),
                          callUsItem(
                              icon: Icons.call,
                              content: state.model!.phone,
                              onTap: () =>
                                  Utils.callPhone(phone: state.model!.phone)),
                        ],
                      );
                    } else {
                      return SizedBox(
                        height: 100,
                        child: LoadingDialog.showLoadingView(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget callUsItem({
    required IconData icon,
    required String content,
    required void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: MyColors.greyWhite,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                icon,
                color: MyColors.white,
                size: 30,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyText(
                  title: content,
                  size: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showFileTypeDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              DefaultButton(
                title: "صورة",
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onTap: () => setCallFile(FileType.image, context),
                borderColor: MyColors.primary,
                color: MyColors.white,
                textColor: MyColors.primary,
              ),
              DefaultButton(
                title: "ملف",
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onTap: () => setCallFile(FileType.any, context),
                borderColor: MyColors.primary,
                color: MyColors.white,
                textColor: MyColors.primary,
              ),
            ],
          ),
        );
      },
    );
  }
}
