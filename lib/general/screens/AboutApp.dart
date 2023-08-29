// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
 import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/models/PageModel.dart';
import 'package:heraggoods/general/resources/GeneralRepository.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/HeaderLogo.dart';

class AboutApp extends StatefulWidget {
  final PageModel page;

  const AboutApp({super.key, required this.page});
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: widget.page.name, //"عن التطبيق"
        con: context,
      ),
      key: _scaffold,
      body: FutureBuilder<String>(
        future: GeneralRepository(context).aboutApp(widget.page.id, true),
        builder: (co, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              children: [
                const HeaderLogo(),
                Html(
                  data: snapshot.data,
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
