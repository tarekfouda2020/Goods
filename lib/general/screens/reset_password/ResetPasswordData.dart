// ignore_for_file: use_build_context_synchronously, file_names

part of 'ResetPasswordImports.dart';

class ResetPasswordData {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ResetPasswordCubit resetPasswordCubit = ResetPasswordCubit();
  final TextEditingController _code = TextEditingController();
  final TextEditingController _new = TextEditingController();
  final TextEditingController _conform = TextEditingController();
  final GenericCubit<bool> shownewPass =GenericCubit(true);
  final GenericCubit<bool> showconfirmPass =GenericCubit(true);

  void setForgetPassword(BuildContext context, String userId) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState!.validate()) {
      resetPasswordCubit.onUpdateLoadingState(true);
      bool result = await GeneralRepository(context)
          .resetUserPassword(userId, _code.text, _new.text);
      resetPasswordCubit.onUpdateLoadingState(false);
      if (result) {
        AutoRouter.of(context).popAndPush(const LoginRoute());
      }
    }
  }
}
