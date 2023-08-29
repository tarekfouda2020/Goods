// ignore_for_file: implementation_imports, file_names

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
 import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utilities/routers/RouterImports.gr.dart';
import '../../widgets/MyText.dart';
import '../MyColors.dart';

class LoadingDialog {
  static showLoadingDialog() {
    EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
        indicator: SpinKitCubeGrid(
          size: 40.0,
          itemBuilder: (context, index) {
            return Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: MyColors.primary, shape: BoxShape.circle),
            );
          },
        ),
        status: "جاري التحميل");
  }

  static showLoadingView() {
    return Center(
      child: SpinKitCubeGrid(
        color: MyColors.primary,
        size: 40.0,
      ),
    );
  }

  static void dismissDialog() {
    EasyLoading.dismiss();
  }

  static showConfirmDialog(
      {required BuildContext context,
      required String title,
      required Function() confirm}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(title, confirm, context, tr("confirm"));
      },
    );
  }

  static showAuthDialog({required BuildContext context}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(
          tr("continueAuth"),
          () => AutoRouter.of(context).popAndPush(const LoginRoute()),
          context,
          tr("enter"),
        );
      },
    );
  }

  static Widget _alertDialog(
      String title, Function() confirm, BuildContext context, String okText) {
    return CupertinoAlertDialog(
      title: MyText(
        title: title,
        size: 12,
        color: MyColors.black,
      ),
      // content: MyText(title: title,size: 12,color: MyColors.blackOpacity,),
      actions: [
        CupertinoDialogAction(
          child: MyText(
            title: tr("back"),
            size: 12,
            color: MyColors.blackOpacity,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          onPressed: confirm,
          child: MyText(
            title: okText,
            size: 12,
            color: MyColors.blackOpacity,
          ),
        ),
      ],
    );
  }

  static showToastNotification(msg,
      {Color? color, Color? textColor, ToastGravity? toastGravity}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
        backgroundColor: color ?? MyColors.primary,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }

  static showSimpleToast(msg, {Color? color, Color? textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? MyColors.primary,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }
}
