// ignore_for_file: implementation_imports, file_names

import 'package:flutter/material.dart';

import '../../general/constants/MyColors.dart';
import '../../general/widgets/MyText.dart';

class TitleButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function()? onTap;
  final EdgeInsets? padding;
  final Color? iconColor;

  const TitleButton(
      {super.key, required this.iconData,
      required this.title,
      required this.onTap,
      this.padding,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ??const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 20,
              color: iconColor ?? Colors.black45,
            ),
        const    SizedBox(
              width: 10,
            ),
            MyText(
              title: title,
              size: 10,
              color:  MyColors.blackOpacity,
            )
          ],
        ),
      ),
    );
  }
}
