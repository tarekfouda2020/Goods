// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationContainer extends StatelessWidget {
  final Widget child;
  final int index;
  final bool vertical;
  final bool scale;
  final double distance;
  final Duration duration;

  const AnimationContainer(
      {super.key,
      required this.child,
      required this.index,
      this.vertical = true,
      this.distance = 100,
      this.scale = false,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: duration,
      child: Visibility(
        visible: scale,
        replacement: Visibility(
          // ignore: sort_child_properties_last
          child: SlideAnimation(
            verticalOffset: distance,
            child: FadeInAnimation(
              child: child,
            ),
          ),
          visible: vertical,
          replacement: SlideAnimation(
            horizontalOffset: distance,
            child: FadeInAnimation(
              child: child,
            ),
          ),
        ),
        child: ScaleAnimation(
          child: FadeInAnimation(
            child: child,
          ),
        ),
      ),
    );
  }
}
