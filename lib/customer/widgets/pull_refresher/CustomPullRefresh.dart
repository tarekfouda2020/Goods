// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../general/constants/MyColors.dart';

class CustomPullRefresh extends StatefulWidget {
  final Widget child;
  final RefreshController controller;
  final Function() onRefresh;

  const CustomPullRefresh(
      {super.key,
      required this.controller,
      required this.onRefresh,
      required this.child});

  @override
  _CustomPullRefreshState createState() => _CustomPullRefreshState();
}

class _CustomPullRefreshState extends State<CustomPullRefresh> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      header: WaterDropHeader(
        waterDropColor: MyColors.primary,
      ),
      controller: widget.controller,
      onRefresh: widget.onRefresh,
      physics: const BouncingScrollPhysics(),
      footer: const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        completeDuration: Duration(milliseconds: 500),
        height: 100,
      ),
      child: widget.child,
    );
  }
}
