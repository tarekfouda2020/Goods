// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously, file_names

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:heraggoods/customer/models/Dtos/RegisterModel.dart';
import 'package:heraggoods/customer/resources/CustomerRepository.dart';
import 'package:heraggoods/general/constants/Inputs/LabelTextField.dart';
import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/utilities/routers/RouterImports.gr.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';
import 'package:heraggoods/general/widgets/DefaultButton.dart';
import 'package:heraggoods/general/widgets/HeaderLogo.dart';
import 'package:heraggoods/general/widgets/MyText.dart';

import 'register_cubit/register_cubit.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phone = TextEditingController();
  final RegisterCubit registerCubit = RegisterCubit();

  void setUserRegister(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      if (!registerCubit.state.terms!) {
        LoadingDialog.showToastNotification("قم بالموافقة علي الشروط والأحكام");
        return;
      }
      registerCubit.onChangeLoadingState();
      RegisterModel? result =
          await CustomerRepository(context).sendCode(phone.text);
      registerCubit.onChangeLoadingState();
      if (result != null) {
        AutoRouter.of(context).push(ActiveAccountRoute(model: result));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      backgroundColor: MyColors.white,
      body: BlocBuilder<RegisterCubit, RegisterState>(
          bloc: registerCubit,
          builder: (con, state) {
            return IgnorePointer(
              ignoring: state.loading!,
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
                                  title: tr("register"),
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
                                      horizontal: 10, vertical: 10),
                                  type: TextInputType.phone,
                                  label: tr("phone"),
                                  isPassword: false,
                                  controller: phone,
                                  action: TextInputAction.done,
                                  onSubmit: () => setUserRegister(context),
                                  validate: (value) =>
                                      Validator().validatePhone(value: value),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: state.terms,
                                        onChanged: (val) =>
                                            registerCubit.onChangeTermsState()),
                                    InkWell(
                                        onTap: () => AutoRouter.of(context)
                                            .push(const TermsRoute()),
                                        child: MyText(
                                          title: "اوافق علي الشروط والأحكام",
                                          size: 10,
                                          color: MyColors.blackOpacity,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //register button
                    Visibility(
                      // ignore: sort_child_properties_last
                      child: DefaultButton(
                        title: tr("continue"), //"تسجيل دخول",
                        margin:const EdgeInsets.all(30),
                        onTap: () => setUserRegister(context),
                      ),
                      visible: !state.loading!,
                      replacement: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: SpinKitDualRing(
                          color: MyColors.primary,
                          size: 30.0,
                        ),
                      ),
                    ),
                    //register text link
                    Container(
                      margin:const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          MyText(
                            title: tr("haveAccount"),
                            size: 10,
                            color: Colors.grey,
                          ),
                        const  SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              onTap: () => AutoRouter.of(context).pop(),
                              child: MyText(
                                title: tr("login"),
                                size: 10,
                                color: MyColors.primary,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    registerCubit.onInitialState();
    registerCubit.close();
    phone.clear();
    super.dispose();
  }
}
