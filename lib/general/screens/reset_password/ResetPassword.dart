// ignore_for_file: file_names

part of 'ResetPasswordImports.dart';

class ResetPassword extends StatefulWidget {
  final String userId;
  const ResetPassword({super.key, required this.userId});
  @override
  State<StatefulWidget> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> with ResetPasswordData {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      body: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        bloc: resetPasswordCubit,
        builder: (context, state) {
          return IgnorePointer(
            ignoring: state.showLoading,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                padding: const EdgeInsets.symmetric(vertical: 20),
                children: <Widget>[
                  const HeaderLogo(),
                  _buildFormInputs(),
                  _buildConfirmButton(state.showLoading),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFormInputs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText(
                title: tr("resetPassword"),
                size: 12,
                color: MyColors.black,
                alien: TextAlign.center,
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                  color: MyColors.primary,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  LabelTextField(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    type: TextInputType.number,
                    label: tr("activeCode"),
                    isPassword: false,
                    controller: _code,
                    action: TextInputAction.next,
                    validate: (value) =>
                        Validator().validateEmpty(value: value),
                  ),
                  BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
                    bloc: shownewPass,
                    builder: (context, shownewPassState) {
                      return LabelTextField(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        type: TextInputType.text,
                        label: tr("newPassword"),
                        isPassword: shownewPassState.data ? true : false,
                        controller: _new,
                        action: TextInputAction.next,
                        validate: (value) =>
                            Validator().validatePassword(value: value),
                        suffixIcon: InkWell(
                          onTap: () =>
                              shownewPass.onUpdateData(!shownewPassState.data),
                          child: Icon(
                            shownewPassState.data
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20,
                          ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
                    bloc: showconfirmPass,
                    builder: (context, showconfirmPassState) {
                      return LabelTextField(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        type: TextInputType.text,
                        label: tr("confirmPassword"),
                        isPassword: showconfirmPassState.data ? true : false,
                        controller: _conform,
                        action: TextInputAction.done,
                        onSubmit: () =>
                            setForgetPassword(context, widget.userId),
                        validate: (value) => Validator()
                            .validatePasswordConfirm(
                                confirm: value, pass: _new.text),
                        suffixIcon: InkWell(
                          onTap: () => showconfirmPass
                              .onUpdateData(!showconfirmPassState.data),
                          child: Icon(
                            showconfirmPassState.data
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
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmButton(bool showLoading) {
    return Visibility(
      // ignore: sort_child_properties_last
      child: InkWell(
        onTap: () => setForgetPassword(context, widget.userId),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: MyText(
            title: tr("send"),
            size: 12,
            color: Colors.white,
          ),
        ),
      ),
      visible: !showLoading,
      replacement: SpinKitDualRing(
        color: MyColors.primary,
        size: 30.0,
      ),
    );
  }
}
