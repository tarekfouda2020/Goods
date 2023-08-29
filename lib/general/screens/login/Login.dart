// ignore_for_file: library_private_types_in_public_api, file_names

part of 'LoginImports.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with LoginData {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        key: scaffold,
        backgroundColor: MyColors.white,
        body: BlocBuilder<LoginCubit, LoginState>(
          bloc: loginCubit,
          builder: (context, state) {
            return IgnorePointer(
              ignoring: state.loading,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.only(bottom: 20),
                  children: <Widget>[
                    const HeaderLogo(),
                    //form inputs
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MyText(
                                  title: tr("login"),
                                  size: 16,
                                  color: MyColors.primary,
                                  alien: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                LabelTextField(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  type: TextInputType.phone,
                                  label: tr("phone"),
                                  isPassword: false,
                                  controller: phone,
                                  action: TextInputAction.next,
                                  validate: (value) =>
                                      Validator().validatePhone(value: value),
                                ),
                                BlocBuilder<GenericCubit<bool>,
                                    GenericState<bool>>(
                                  bloc: showPass,
                                  builder: (context, showPassState) {
                                    return LabelTextField(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      type: TextInputType.text,
                                      label: tr("password"),
                                      isPassword:
                                          showPassState.data ? true : false,
                                      controller: pass,
                                      action: TextInputAction.done,
                                      onSubmit: () => setUserLogin(context),
                                      validate: (value) => Validator()
                                          .validatePassword(value: value),
                                      suffixIcon: InkWell(
                                        onTap: () => showPass
                                            .onUpdateData(!showPassState.data),
                                        child: Icon(
                                          showPassState.data
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => AutoRouter.of(context)
                                .push(const ForgetPasswordRoute()),
                            child: MyText(
                              title: tr("forgetPassword"),
                              size: 10,
                              color: MyColors.blackOpacity,
                              decoration: TextDecoration.underline,
                              alien: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //login button
                    Visibility(
                      visible: !state.loading,
                      replacement: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: SpinKitDualRing(
                          color: MyColors.primary,
                          size: 30.0,
                        ),
                      ),
                      child: DefaultButton(
                        title: tr("login"), //"تسجيل دخول",
                        margin: const EdgeInsets.all(30),
                        onTap: () => setUserLogin(context),
                      ),
                    ),

                    //visitor link
                    InkWell(
                      onTap: () => enterAsVisitor(context),
                      child: MyText(
                        title: "الدخول كزائر",
                        size: 10,
                        color: MyColors.black,
                        decoration: TextDecoration.underline,
                        alien: TextAlign.center,
                      ),
                    ),

                    //register text link
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          MyText(
                            title: tr("don'tHaveAccount"),
                            size: 12,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              onTap: () => AutoRouter.of(context)
                                  .push(const RegisterRoute()),
                              child: MyText(
                                title: tr("register"),
                                size: 12,
                                color: MyColors.primary,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    pass.clear();
    phone.clear();
    loginCubit.close();
    super.dispose();
  }
}
