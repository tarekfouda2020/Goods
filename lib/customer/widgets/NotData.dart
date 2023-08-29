// ignore_for_file: deprecated_member_use, duplicate_ignore, file_names

import 'package:flutter/material.dart';

/// Basic layout for indicating that an exception occurred.
class NoData extends StatelessWidget {
  const NoData({
    required this.title,
    this.message,
    this.onTryAgain,
    Key? key,
  })  : assert(title != null),
        super(key: key);
  final String? title;
  final String? message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          Text(
            title??"",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
          if (message != null)
            const SizedBox(
              height: 16,
            ),
          if (message != null)
            Text(
              message??"",
              textAlign: TextAlign.center,
            ),
          if (onTryAgain != null)
            const SizedBox(
              height: 48,
            ),
          if (onTryAgain != null)
            const SizedBox(
              height: 50,
              width: double.infinity,
              // ignore: deprecated_member_use
              // child: RaisedButton.icon(
              //   onPressed: onTryAgain,
              //   icon: const Icon(
              //     Icons.refresh,
              //     color: Colors.white,
              //   ),
              //   label: const Text(
              //     'Try Again',
              //     style: TextStyle(
              //       fontSize: 16,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              
            ),
        ],
      ),
    ),
  );
}
