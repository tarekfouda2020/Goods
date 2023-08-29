// ignore_for_file: use_build_context_synchronously, file_names

part of 'LoginImports.dart';

class LoginData {
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phone = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final LoginCubit loginCubit = LoginCubit();
  final GenericCubit<bool> showPass = GenericCubit(true);

  void setUserLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      loginCubit.onchangeLoginLoading();
      String phoneEn = Utils.convertDigitsToLatin(phone.text);
      String passEn = Utils.convertDigitsToLatin(pass.text);
      bool result =
          await GeneralRepository(context).setUserLogin(phoneEn, passEn);
      loginCubit.onchangeLoginLoading();
      if (result) {
        context.read<AuthCubit>().onUpdateAuth(true);
        int parentCount =
            (await context.read<MyDatabase>().selectParentCatsAsync()).length;
        AutoRouter.of(context).push(HomeRoute(parentCount: parentCount));
      }
    }
  }

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }

  void enterAsVisitor(BuildContext context) async {
    context.read<AuthCubit>().onUpdateAuth(false);
    int parentCount =
        (await context.read<MyDatabase>().selectParentCatsAsync()).length;
    AutoRouter.of(context).push(HomeRoute(parentCount: parentCount));
  }
}
