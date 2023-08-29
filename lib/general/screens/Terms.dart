// ignore_for_file: file_names

import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/resources/GeneralRepository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/MyText.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TermsState();
  }
}

class _TermsState extends State<Terms> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr("terms"), //"الشروط والأحكام",
        con: context,
      ),
      key: _scaffold,
      body: FutureBuilder<String>(
        future: GeneralRepository(context).terms(),
        builder: (con, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              children: [
                MyText(
                  title: snapshot.data!,
                  size: 10,
                  color: MyColors.blackOpacity,
                ),
              ],
            );
          } else {
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
    );
  }
}
