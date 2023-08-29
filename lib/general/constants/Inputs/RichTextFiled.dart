 // ignore_for_file: file_names

 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';

class RichTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final EdgeInsets margin;
  final TextInputType type;
  final int? min, max;
  final double? height;
  final Function(String value) validate;
  final Color? fillColor;
  final bool readOnly;
  final TextInputAction? action;
  final Function(String value)? submit;

  const RichTextFiled(
      {super.key, this.label,
      this.controller,
      this.margin = const EdgeInsets.all(0),
      this.type = TextInputType.text,
      this.max,
      this.min,
      this.height,
      required this.validate,
      this.fillColor,
      this.readOnly = false,
      this.action,
      this.submit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        textInputAction: action ?? TextInputAction.done,
        onFieldSubmitted: submit,
        minLines: min,
        maxLines: max,
        readOnly: readOnly,
        style: GoogleFonts.cairo(fontSize: 14, color: Colors.black87),
        validator: (value) => validate(value!),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: MyColors.grey.withOpacity(.5), width: 1),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.primary, width: 2)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: MyColors.grey.withOpacity(.5), width: 1),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:const BorderSide(color: Colors.red, width: 2)),
            errorStyle: GoogleFonts.cairo(fontSize: 10),
            hintText: "$label",
            labelStyle: GoogleFonts.cairo(fontSize: 14, color: Colors.black54),
            hintStyle: GoogleFonts.cairo(fontSize: 14, color: Colors.black54),
            fillColor: fillColor ?? MyColors.white,
            contentPadding:const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            filled: true),
      ),
    );
  }
}
