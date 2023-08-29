// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';

class Validator {
  String? noValidate({required String value}) {
    return null;
  }

  String? validateEmpty({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? tr("fillField");
    }
    return null;
  }

  String? validateDropDown<DataType>({required DataType model, String? message}) {
    if (model == null) {
      return message ?? tr("fillField");
    }
    return null;
  }

  String? validatePassword({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? tr("fillField");
    } else if (value.length < 6) {
      return message ?? tr("passValidation");
    }
    return null;
  }

  String? validateEmail({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? tr("fillField");
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return message ?? tr("mailValidation");
    }
    return null;
  }

  String? validateUserName({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? tr("fillField");
    } else if (!RegExp(
            r"^[A-z]{1,}[A-z0-9]{0,}$")
        .hasMatch(value)) {
      return message ?? tr("userNameValidation");
    }
    return null;
  }

  String? validateEmailORNull({required String value, String? message}) {
    if (value.trim().isNotEmpty) {
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return message ?? tr("mailValidation");
      }
    }
    return null;
  }

  String? validatePhone({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? tr("fillField");
    } else if (!RegExp(
                r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
            .hasMatch(value) ||
        value.length < 10) {
      return message ?? tr("phoneValidation");
    }
    return null;
  }

  String? validatePasswordConfirm(
      {required String confirm, required String pass, String? message}) {
    if (confirm.trim().isEmpty) {
      return message ?? tr("fillField");
    } else if (confirm != pass) {
      return message ?? tr("confirmValidation");
    }
    return null;
  }
}
