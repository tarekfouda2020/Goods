// ignore_for_file: file_names, use_build_context_synchronously, unused_local_variable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/Dtos/RegisterModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';

class RegisterCompleteData {
    GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController name = TextEditingController();
    TextEditingController password = TextEditingController();

   void setUserRegister(BuildContext context, RegisterModel model) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      model.userName = name.text;
      model.password = password.text;
      model.projectName = "سلع";
      bool result = await CustomerRepository(context).userRegister(model);
      if (result) {
        AutoRouter.of(context).push(const LoginRoute());
      }
    }
  }
}
