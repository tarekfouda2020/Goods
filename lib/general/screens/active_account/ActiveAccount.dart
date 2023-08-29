// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:heraggoods/customer/models/Dtos/RegisterModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/general/constants/Inputs/LabelTextField.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/HeaderLogo.dart';
import 'package:heraggoods/general/widgets/MyText.dart';

class ActiveAccount extends StatefulWidget {
  final RegisterModel model;

  const ActiveAccount({super.key, required this.model});
  @override
  State<StatefulWidget> createState() => _ActiveAccountState();
}

class _ActiveAccountState extends State<ActiveAccount> {
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController code = TextEditingController();
  RegisterModel? model;

  void setRegisterModel(RegisterModel registerModel) {
    model = registerModel;
  }

  void setActiveUser(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      if (code.text == model!.code) {
        AutoRouter.of(context).push(RegisterCompleteRoute(model: model!));
      } else {
        LoadingDialog.showToastNotification("ادخل الكود صحيحا");
      }
    }
  }

  void setResendCode(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    CustomerRepository(context).resendCode(model!);
  }

  @override
  void initState() {
    super.initState();
    setRegisterModel(widget.model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      backgroundColor: MyColors.white,
      body: ListView(
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
                        title: tr("activeAccount"),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        title: "ادخل كود التحقق 1234",
                        size: 12,
                        color: MyColors.primary,
                        alien: TextAlign.center,
                      ),
                      LabelTextField(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        type: TextInputType.phone,
                        label: tr("activeCode"),
                        isPassword: false,
                        controller: code,
                        action: TextInputAction.done,
                        onSubmit: () => setActiveUser(context),
                        validate: (value) =>
                            Validator().validateEmpty(value: value),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //register button
          DefaultButton(
            title: tr("continue"), //"تسجيل دخول",
            margin: const EdgeInsets.all(30),
            onTap: () => setActiveUser(context),
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
                  title: "لم استلم الرسالة ؟",
                  size: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () => setResendCode(context),
                    child: MyText(
                      title: tr("resend"),
                      size: 10,
                      color: MyColors.primary,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
