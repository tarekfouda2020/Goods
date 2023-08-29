// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
 import 'package:heraggoods/general/constants/ModaLs/LoadingDialog.dart';
import 'package:heraggoods/general/models/PageModel.dart';
import 'package:heraggoods/general/screens/remote_page/remote_page_cubit/remote_page_cubit.dart';
import 'package:heraggoods/general/widgets/DefaultAppBar.dart';
import 'package:heraggoods/general/widgets/HeaderLogo.dart';

import '../../constants/MyColors.dart';

class RemotePage extends StatefulWidget {
  final PageModel page;
  const RemotePage({super.key, required this.page});
  @override
  _RemotePageState createState() => _RemotePageState();
}

class _RemotePageState extends State<RemotePage> {
  final RemotePageCubit remotePageCubit = RemotePageCubit();

  @override
  void initState() {
    remotePageCubit.fetchPageContent(context, widget.page.id, refresh: false);
    remotePageCubit.fetchPageContent(context, widget.page.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: widget.page.name, //"عن التطبيق"
        con: context,
      ),
      body: BlocBuilder<RemotePageCubit, RemotePageState>(
        bloc: remotePageCubit,
        builder: (context, state) {
          print(state.content);
          if (state is RemotePageUpdated) {
            return ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              children: [
                const HeaderLogo(),
                Html(
                  data: state.content,
                  style: {
                    "p": Style(
                      fontSize: FontSize(18.0),
                      textAlign: TextAlign.justify,
                    ),
                    "h6":Style(
                      fontSize: FontSize(14.0),
                      fontWeight: FontWeight.normal,
                      display: Display.inline
                    ),
                    "li":Style(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                    )
                  },
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
