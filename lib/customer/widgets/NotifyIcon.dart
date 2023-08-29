// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/blocs/notify_count_cubit/notify_count_cubit.dart';
 
class NotifyIcon extends StatefulWidget {
  final Color color;

  const NotifyIcon({super.key, required this.color});
  @override
  _NotifyIconState createState() => _NotifyIconState();
}

class _NotifyIconState extends State<NotifyIcon> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<NotifyCountCubit>();
    return SizedBox(
      height: 36,
      width: 40,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Visibility(
            visible: provider.state.count != 0,
            replacement: Container(),
            child: Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding:const EdgeInsets.all(5),
                decoration:
                   const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Text('${provider.state.count}',
                    style:const TextStyle(fontSize: 10, color: Colors.white)),
              ),
            ),
          ),
          Icon(
            Icons.notifications,
            color: widget.color,
            size: 25,
          ),
        ],
      ),
    );
  }
}
