// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyColors {
  static Color primary = const Color(0xff2a3b55);
  static Color secondary = Colors.black;
  static Color gold = const Color(0xffe4aa69);
  static Color grey = Colors.grey;
  static Color greyWhite = Colors.grey.withOpacity(.2);
  static Color black = const Color(0xff313135);
  static Color blackOpacity = Colors.black54;
  static Color white = Colors.white;
  static Color greenColor = Colors.green;
  static Color notifyColor = Colors.black54;

  static setColors(
      {required Color primaryColor, required Color secondaryColor}) {
    primary = primaryColor;
    secondary = secondaryColor;
  }
}
