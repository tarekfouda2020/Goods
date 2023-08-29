// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/MyText.dart';
import '../MyColors.dart'; 

class CustomModal extends StatelessWidget {
  final Widget content;
  final String title;

  const CustomModal({super.key, required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Container(),
          middle: MyText(
            title: title,
            size: 12,
            color: MyColors.black,
          ),
          trailing: IconButton(
            icon:const Icon(
              Icons.close,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: MyColors.primary,
        ),
        child: SafeArea(
          bottom: false,
          child: content,
        ),
      ),
    );
  }
}
