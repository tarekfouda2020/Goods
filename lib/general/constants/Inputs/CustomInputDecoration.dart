 // ignore_for_file: overridden_fields, annotate_overrides, file_names

 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';

class CustomInputDecoration extends InputDecoration {
  final String lang;
  final String? labelTxt;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? enableColor;
  final Color? focusColor;
  final double? borderRaduis;
  final EdgeInsets? padding;

  const CustomInputDecoration(
      {required this.lang,
      this.hint,
      this.labelTxt,
      this.prefixIcon,
      this.suffixIcon,
      this.enableColor,
      this.focusColor,
      this.borderRaduis,
      this.padding})
      : super();

  @override
  InputBorder get enabledBorder => OutlineInputBorder(
        borderSide: BorderSide(color: enableColor ?? MyColors.grey, width: .5),
        borderRadius: BorderRadius.circular(borderRaduis ?? 5),
      );

  @override
  InputBorder get focusedBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRaduis ?? 5),
      borderSide: BorderSide(color: focusColor ?? MyColors.primary, width: 1));

  @override
  InputBorder get errorBorder => OutlineInputBorder(
      borderSide:const BorderSide(color: Colors.red, width: .5),
      borderRadius: BorderRadius.circular(borderRaduis ?? 5));

  @override
  InputBorder get focusedErrorBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRaduis ?? 5),
      borderSide:const BorderSide(color: Colors.red, width: 2));

  @override
  TextStyle get errorStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 12)
      : GoogleFonts.cairo(fontSize: 10);

  @override
  String? get hintText => hint;

  @override
  Widget? get label => labelTxt == null
      ? super.label
      : Text(
          labelTxt ?? "",
          style: labelStyle,
        );

  @override
  TextStyle get labelStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 16)
      : GoogleFonts.cairo(fontSize: 14);

  @override
  TextStyle? get hintStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 16)
      : GoogleFonts.cairo(fontSize: 14);

  @override
  EdgeInsetsGeometry get contentPadding =>
      padding ??const EdgeInsets.symmetric(horizontal: 10, vertical: 15);

  @override
  bool get filled => true;

  @override
  Color get fillColor => MyColors.white;

  @override
  bool get alignLabelWithHint => true;
}
