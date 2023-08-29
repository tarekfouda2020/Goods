// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
 import 'package:flutter/material.dart';
import 'package:heraggoods/general/widgets/MyText.dart';


class Politics extends StatefulWidget{
  const Politics({super.key});


  @override
  State<StatefulWidget> createState() {
     return _PoliticsState();
  }

}

class _PoliticsState extends State<Politics>{

  final GlobalKey<ScaffoldState> _scafold=  GlobalKey();


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      key: _scafold,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
           const  Positioned(
              top: 0,
              left: 0,
              child: Image(image: AssetImage("images/shapeHome.png"),width: 200,height: 200,fit: BoxFit.fill,),
            ),

            AppBar(
              title: MyText(title: tr("socialResponsibility"), //"المسؤلية الإجتماعية",
                size: 12,color: Colors.black54,),
              leading: IconButton(
                icon:const Icon(Icons.arrow_back_ios,size: 25,color: Colors.black54,),
                onPressed: ()=> Navigator.of(context).pop(),
              ),
              titleSpacing: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              elevation: 0,
              actions:const <Widget>[
              ],
            ),
            // cart details
            Container(
              width: MediaQuery.of(context).size.width,
              padding:const EdgeInsets.symmetric(horizontal: 15),
              margin:const EdgeInsets.only(top: 120),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width-40,
                    child: MyText(
                      //title: "هذ النص يمكن استبدالة بنص اخر هذ النص يمكن استبدالة بنص اخر هذ النص يمكن استبدالة بنص اخر هذ النص يمكن استبدالة بنص اخر هذ النص يمكن استبدالة بنص اخر ",
                      title: tr("sampleText"),
                      size: 12,
                      color: Colors.black54,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}