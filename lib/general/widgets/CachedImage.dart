// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; 

import '../../res.dart';
import '../constants/MyColors.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? height, width;
  final BorderRadius? borderRadius;
  final ColorFilter? colorFilter;
  final Alignment? alignment;
  final Widget? child;
  final Color? borderColor;
  final Color? loadingColor;
  final Color? bgColor;
  final BoxShape? boxShape;
  final bool haveRadius;
  const CachedImage(
      {super.key, required this.url,
      this.fit,
      this.width,
      this.height,
      this.borderRadius,
      this.colorFilter,
      this.loadingColor,
      this.alignment,
      this.child,
      this.boxShape,
      this.borderColor,
      this.bgColor,
      this.haveRadius = true});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.fill,
              colorFilter: colorFilter),
          borderRadius:
              haveRadius ? borderRadius ?? BorderRadius.circular(0) : null,
          shape: boxShape ?? BoxShape.rectangle,
          border:
              Border.all(color: borderColor ?? Colors.transparent, width: 1),
        ),
        alignment: alignment ?? Alignment.center,
        child: child,
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius:
                haveRadius ? borderRadius ?? BorderRadius.circular(0) : null,
            border:
                Border.all(color: borderColor ?? Colors.transparent, width: 1),
            shape: boxShape ?? BoxShape.rectangle,
            // image: DecorationImage(
            //     image: AssetImage(Res.logo),
            //     fit: BoxFit.contain,
            //     colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken)
            // ),
            color: bgColor ?? MyColors.primary.withOpacity(.5)),
        child: SpinKitFadingCircle(
          color: loadingColor ?? MyColors.primary,
          size: 30.0,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor ?? MyColors.secondary.withOpacity(.5),
            borderRadius:
                haveRadius ? borderRadius ?? BorderRadius.circular(0) : null,
            border:
                Border.all(color: borderColor ?? Colors.transparent, width: 1),
            shape: boxShape ?? BoxShape.rectangle,
            image: const DecorationImage(
              image: AssetImage(Res.logo),
              fit: BoxFit.contain,
            )),
        child: child,
      ),
    );
  }
}
