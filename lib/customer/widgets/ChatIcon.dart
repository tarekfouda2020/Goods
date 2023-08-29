// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/blocs/chat_count_cubit/chat_count_cubit.dart';

class ChatIcon extends StatefulWidget {
  final Color color;

  const ChatIcon({super.key, required this.color});

  @override
  _ChatIconState createState() => _ChatIconState();
}

class _ChatIconState extends State<ChatIcon> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ChatCountCubit>();
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
                  const  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Text('${provider.state.count}',
                    style:const TextStyle(fontSize: 10, color: Colors.white)),
              ),
            ),
          ),
          Icon(
            Icons.mail_outline,
            color: widget.color,
            size: 25,
          ),
        ],
      ),
    );
  }
}
