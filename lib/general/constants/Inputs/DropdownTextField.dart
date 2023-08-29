
// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart'; 
import '../../blocs/lang_bloc/lang_bloc.dart';
import '../../widgets/MyText.dart';
import '../MyColors.dart';
import 'CustomInputDecoration.dart';
import 'custom_dropDown/CustomDropDown.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownTextField<DataType> extends StatefulWidget {
  final dynamic data;
  final GlobalKey? dropKey;
  final String? label;
  final String? hint;
  final DataType? selectedItem;
  final bool showSelectedItem;
  final EdgeInsets? margin;
  final double? fontSize;
  final double? labelSize;
  final dynamic validate;
  final dynamic onChange;
  final dynamic finData;
  final EdgeInsets? downIconPadding;
  final bool useName;
  final dynamic itemBuilder;

  const DropdownTextField(
      {super.key, this.label,
      this.hint,
      this.margin,
      this.validate,
      this.downIconPadding,
      this.useName = true,
      this.onChange,
      this.fontSize,
      this.labelSize,
      this.finData,
      this.dropKey,
      this.data,
      this.itemBuilder,
      this.selectedItem,
      this.showSelectedItem = false});

  @override
  _DropdownTextFieldState<DataType> createState() =>
      _DropdownTextFieldState<DataType>();
}

class _DropdownTextFieldState<DataType> extends State<DropdownTextField> {
  @override
  Widget build(BuildContext context) {
    var lang = context.read<LangBloc>().state.lang;
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      child: DropdownSearch<DataType>(
        key: widget.dropKey,
        mode: Mode.BOTTOM_SHEET,
        isFilteredOnline: true,
        maxHeight: 350,
        label: widget.label,
        items: widget.data,
        onFind: widget.finData,
        popupItemBuilder: widget.itemBuilder,
        validator: widget.validate,
        onChanged: widget.onChange,
        showSearchBox: true,
        labelstyle: TextStyle(color: MyColors.black),
        showClearButton: true,
        selectedItem: widget.selectedItem,
        itemAsString: (dynamic u) => widget.useName ? u.name : u,
        showSelectedItem: widget.showSelectedItem,
        style:  TextStyle(color: MyColors.black),
        searchBoxDecoration: CustomInputDecoration(
          lang: lang,
          hint: "search",
          enableColor:  MyColors.black,
          focusColor: MyColors.primary,
          borderRaduis: 5,
          padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        popupTitle: Container(
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: MyText(
              title: widget.label != null ? widget.label! : widget.hint!,
              size: 16,
              color: MyColors.white,
            ),
          ),
        ),
        popupShape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        dropdownSearchDecoration: CustomInputDecoration(
          lang: lang,
          hint: widget.hint,
          enableColor: MyColors.blackOpacity,
          focusColor: MyColors.primary,
          borderRaduis: 50,
          padding:const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
