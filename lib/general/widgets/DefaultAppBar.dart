// ignore_for_file: deprecated_member_use, file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/MyColors.dart';
import 'MyText.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext con;
  final Widget? leading;
  final Function()? onTitleClick;
  final List<Widget>? actions;
  final double leadingWidth;

  const DefaultAppBar({
    super.key,
    this.onTitleClick,
    required this.title,
    required this.con,
    this.actions,
    this.leading,
    this.leadingWidth = 54,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: InkWell(
        onTap: onTitleClick,
        child: MyText(
          title: title,
          size: 14,
          color: MyColors.white,
        ),
      ),
      centerTitle: false,
      backgroundColor: MyColors.primary,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
      ),
      leadingWidth: leadingWidth,
      leading: leading ??
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: MyColors.white,
            ),
            onPressed: () => Navigator.of(con).pop(),
          ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5);
}
