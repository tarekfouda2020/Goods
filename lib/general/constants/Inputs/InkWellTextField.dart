// ignore_for_file: must_be_immutable, file_names

import 'package:google_fonts/google_fonts.dart';
 import 'package:flutter/material.dart';

import '../MyColors.dart';

class InkWellTextField extends StatelessWidget {
  TextEditingController? controller;
  String? label;
  EdgeInsets margin;
  TextInputType type;
  Widget? icon;
  Function()? onTab;
  Icon? prefix;
  bool dropDown;
  Color? borderColor;
  InkWellTextField(
      {super.key, this.label,
      this.controller,
      this.margin = EdgeInsets.zero,
      this.type = TextInputType.text,
      this.onTab,
      this.icon,
      this.prefix,
      this.dropDown = true,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin,
      child: InkWell(
        onTap: onTab,
        child: Visibility(
          // ignore: sort_child_properties_last
          child: TextFormField(
            controller: controller,
            keyboardType: type,
            enabled: false,
            style: GoogleFonts.cairo(fontSize: 14, color: Colors.black87),
            decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: borderColor ?? MyColors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: MyColors.primary.withOpacity(.5), width: 1)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: borderColor ?? MyColors.grey.withOpacity(.5),
                        width: 1),
                    borderRadius: BorderRadius.circular(10)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color: Colors.red, width: 2)),
                errorStyle: GoogleFonts.cairo(fontSize: 10),
                labelText: "  $label  ",
                labelStyle:
                    GoogleFonts.cairo(fontSize: 14, color: Colors.black54),
                contentPadding:const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: icon,
                prefixIcon: prefix,
                filled: true,
                fillColor: MyColors.white),
          ),
          visible: dropDown,
          replacement: TextFormField(
            controller: controller,
            keyboardType: type,
            enabled: true,
            style: TextStyle(
                fontSize: 14,
                fontFamily: "cairo",
                color: Colors.black.withOpacity(.7)),
            decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                    borderSide:const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: MyColors.primary.withOpacity(.5), width: 1)),
                errorBorder: OutlineInputBorder(
                    borderSide:const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:const BorderSide(color: Colors.red, width: 2)),
                errorStyle:const TextStyle(fontFamily: "cairo", fontSize: 10),
                labelText: "  $label  ",
                labelStyle:const TextStyle(fontFamily: "cairo", fontSize: 14,),
                contentPadding:const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                prefixIcon: prefix,
                filled: true,
                fillColor: MyColors.white),
          ),
        ),
      ),
    );
  }
}
