// ignore_for_file: implementation_imports, file_names

import 'package:flutter/material.dart';
import 'package:heraggoods/general/utilities/validator/Validator.dart';

import '../MyColors.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final EdgeInsets? margin;
  final TextInputType? type;
  final Widget? icon;
  final Icon? prefix;
  final Function(String value)? validate;
  final Color? filledColor;
  final TextInputAction? action;
  final Function()? submit;
  const ChatTextField({
    super.key,
    this.label,
    this.controller,
    this.margin,
    this.type,
    this.action,
    this.submit,
    this.icon,
    this.prefix,
    this.filledColor,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(0),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              enabled: true,
              textInputAction: TextInputAction.newline,
              maxLines: null,
              enableSuggestions: false,
              autocorrect: false,
              // minLines: 8,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "cairo",
                color: Colors.black.withOpacity(.7),
              ),
              validator: (value) => Validator().validateEmpty(value: value!),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(.5), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: MyColors.primary, width: 1)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(.5), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2)),
                  hintText: "$label",
                  hintStyle: TextStyle(
                    fontFamily: "cairo",
                    fontSize: 14,
                    color: MyColors.black,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  filled: true,
                  fillColor: filledColor ?? MyColors.white),
            ),
          ),
          IconButton(
            onPressed: submit,
            icon: Icon(
              Icons.send,
              size: 20,
              color: MyColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
