 // ignore_for_file: file_names

 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';

class CustomInputTextStyle extends TextStyle {
  final String lang;

  const CustomInputTextStyle({required this.lang});

  @override
  String get fontFamily => lang == "ar"
      ? GoogleFonts.cairo().fontFamily!
      : GoogleFonts.roboto().fontFamily!;

  @override
  double get fontSize => lang == "ar" ? 16 : 14;

  @override
  Color get color => MyColors.black;
}
