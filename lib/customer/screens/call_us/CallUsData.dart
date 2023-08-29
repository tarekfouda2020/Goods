// ignore_for_file: unnecessary_null_comparison, prefer_null_aware_operators, use_build_context_synchronously, file_names

part of 'CallUsImports.dart';

class CallUsData {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<DropdownSearchState<DropDownModel>> reason = GlobalKey();
  TextEditingController msg = TextEditingController();
  TextEditingController callFile = TextEditingController();
  TextEditingController email = TextEditingController();
  final CallImageCubit callImageCubit = CallImageCubit();
  final CallSocialCubit callSocialCubit = CallSocialCubit();
  String? reasonId;

  void setSelectReason(DropDownModel model) {
    reasonId = model != null ? model.id.toString() : null;
  }

  void setCallFile(FileType type, BuildContext context) async {
    var file = await Utils.getFile();
    if (file != null) {
      callImageCubit.onUpdateFile(file);
      AutoRouter.of(context).pop();
    }
  }

  void setContactUs(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      var result = await CustomerRepository(context).contactUs(
        email: email.text,
        file: callImageCubit.state.file,
        msg: msg.text,
        reasonId: reasonId!,
      );
      if (result) {
        reasonId = "";
        msg.text = "";
        callFile.text = "";
        if (callImageCubit != null) {
          callImageCubit.onUpdateFile(null);
        }
        reason.currentState!.changeSelectedItem(null);
        AutoRouter.of(context).pop();
      }
    }
  }
}
