// ignore_for_file: file_names

part of 'ForgetPasswordImports.dart';

class ForgetPasswordData {
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phone = TextEditingController();
  final ForgetPasswordCubit forgetPasswordCubit = ForgetPasswordCubit();

  void setForgetPassword(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      forgetPasswordCubit.onUpdateLoading(true);
      await GeneralRepository(context).forgetPassword(phone.text);
      forgetPasswordCubit.onUpdateLoading(false);
    }
  }
}
