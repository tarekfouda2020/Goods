// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:heraggoods/res.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: const Image(
        height: 150,
        image: AssetImage(Res.logo),
        fit: BoxFit.contain,
      ),
    );
  }
}
