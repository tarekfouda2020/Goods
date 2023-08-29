// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class MyText extends StatelessWidget {
  String title;
  Color? color = Colors.black;
  double? size = 16;
  TextAlign? alien = TextAlign.start;
  TextDecoration? decoration = TextDecoration.none;
  TextOverflow? overflow;
  bool isNumber;
  FontWeight fontWeight;

  MyText(
      {super.key,
      required this.title,
      this.color,
      this.size,
      this.alien,
      this.decoration,
      this.overflow,
      this.isNumber = false,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alien,
      textScaleFactor: 1.2,
      style: context.locale.languageCode == "ar"
          ? GoogleFonts.cairo(
              color: color,
              fontSize: size,
              decoration: decoration,
              fontWeight: fontWeight)
          : GoogleFonts.abel(
              color: color,
              fontSize: size,
              decoration: decoration,
              fontWeight: fontWeight),
      overflow: overflow,
    );
  }
}
