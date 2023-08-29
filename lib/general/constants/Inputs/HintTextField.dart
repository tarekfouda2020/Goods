// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:google_fonts/google_fonts.dart';
 import 'package:flutter/material.dart';

import '../MyColors.dart'; 

class HintTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final EdgeInsets? margin;
  final bool isPassword;
  final TextInputType? type;
  final Function(String value) validate;
  final Function()? onSubmit;
  final TextInputAction? action;

  const HintTextField(
      {super.key, this.label,
      this.controller,
      this.margin,
      this.isPassword = false,
      this.action,
      this.onSubmit,
      this.type = TextInputType.text,
      required this.validate});
  @override
  _HintTextFieldState createState() => _HintTextFieldState();
}

class _HintTextFieldState extends State<HintTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ??const EdgeInsets.all(0),
      child: ConstrainedBox(
        constraints:const BoxConstraints(
            minHeight: 50,
            maxHeight: 80,
            minWidth: double.infinity,
            maxWidth: double.infinity),
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.type ?? TextInputType.text,
          obscureText: widget.isPassword,
          onEditingComplete: widget.onSubmit,
          enableSuggestions: false,
          autocorrect: false,
          textInputAction: widget.action ?? TextInputAction.next,
          style: GoogleFonts.cairo(
            fontSize: 14,
            color:  Colors.black.withOpacity(.7),
          ),
          validator: (value) => widget.validate(value!),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: MyColors.grey.withOpacity(.8), width: 1),
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
            errorStyle: GoogleFonts.abel(fontSize: 12),
            hintText: "  ${widget.label}  ",
            helperStyle: GoogleFonts.cairo(fontSize: 14),
            contentPadding:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            filled: true,
            fillColor: MyColors.white,
          ),
        ),
      ),
    );
  }
}
