
// ignore_for_file: file_names

import 'package:heraggoods/general/utilities/utils_functions/UtilsImports.dart';
 import 'package:flutter/material.dart';
import 'package:heraggoods/general/constants/MyColors.dart';
import 'package:heraggoods/general/widgets/AnimationContainer.dart';
import 'package:heraggoods/res.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState()=>_SplashState();
}

class _SplashState extends State<Splash> {

  final GlobalKey<ScaffoldState> _scaffold =   GlobalKey<ScaffoldState>();


  @override
  void initState() {
    _checkingData();
    super.initState();
  }

  _checkingData()async{
    Utils.manipulateSplashData(context);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      backgroundColor: MyColors.primary,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimationContainer(
              distance: 500,
              index: 0,
              duration:const Duration(seconds: 2),
              vertical: true,
              child: Image(
                width: 250,
                height: MediaQuery.of(context).size.width,
                image:const AssetImage(Res.logoWhite),
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 220,
                width: MediaQuery.of(context).size.width,
                child: const Image(
                  image: AssetImage(Res.splash),
                  fit: BoxFit.fill,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
