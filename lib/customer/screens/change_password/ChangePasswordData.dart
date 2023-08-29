// ignore_for_file: use_build_context_synchronously, file_names

part of 'ChangePasswordImports.dart';

class ChangePasswordData {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirm = TextEditingController();

  void setChangePassword(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      var result = await CustomerRepository(context)
          .changePassword(oldPassword.text, newPassword.text);
      if (result) {
        AutoRouter.of(context).pop();
      }
    }
  }
}
