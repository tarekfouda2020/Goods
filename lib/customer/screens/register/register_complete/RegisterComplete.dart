// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/Dtos/RegisterModel.dart';
import 'package:heraggoods/general/constants/Inputs/LabelTextField.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/HeaderLogo.dart';
import 'package:heraggoods/general/widgets/MyText.dart';

import 'RegisterCompleteData.dart';

class RegisterComplete extends StatefulWidget {
  final RegisterModel model;

  const RegisterComplete({super.key, required this.model});

  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterComplete> {
  RegisterCompleteData registerCompleteData = RegisterCompleteData();

  @override
  void dispose() {
    super.dispose();
    registerCompleteData.name.clear();
    registerCompleteData.password.clear();
    if (registerCompleteData.scaffold.currentState != null) {
      registerCompleteData.scaffold.currentState!.dispose();
    }
    if (registerCompleteData.scaffold.currentState != null) {
      registerCompleteData.formKey.currentState!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: registerCompleteData.scaffold,
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
                        title: tr("register"),
                        size: 16,
                        color: MyColors.primary,
                        alien: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Form(
                  key: registerCompleteData.formKey,
                  child: Column(
                    children: [
                      LabelTextField(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        type: TextInputType.text,
                        label: "اسم المستخدم",
                        isPassword: false,
                        controller: registerCompleteData.name,
                        action: TextInputAction.next,
                        validate: (value) =>
                            Validator().validateEmpty(value: value),
                      ),
                      LabelTextField(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        type: TextInputType.text,
                        label: tr("password"),
                        isPassword: true,
                        controller: registerCompleteData.password,
                        action: TextInputAction.done,
                        onSubmit: () => registerCompleteData.setUserRegister(
                            context, widget.model),
                        validate: (value) =>
                            Validator().validatePassword(value: value),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //register button
          DefaultButton(
            title: tr("confirm"), //"تسجيل دخول",
            margin: const EdgeInsets.all(30),
            onTap: () =>
                registerCompleteData.setUserRegister(context, widget.model),
          ),
        ],
      ),
    );
  }
}
