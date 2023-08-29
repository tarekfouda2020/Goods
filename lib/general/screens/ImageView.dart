// ignore_for_file: unnecessary_null_comparison, file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heraggoods/general/widgets/MyText.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class ImageView extends StatefulWidget{

  String image;
  ImageView(this.image, {super.key});

  @override
  State<StatefulWidget> createState() {
     return _ImageView();
  }

}

class _ImageView extends State<ImageView>{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,

      appBar:AppBar(
        title: MyText(title: tr("image"),color: const Color(0xff5368a7),size: 16,),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          child:const Icon(Icons.arrow_back_ios,size: 25,color: Color(0xff5368a7),),
          onTap: (){Navigator.of(context).pop();},
        ),

      ),

      body: Container(
        color: const Color(0xfff7f7f7),
        alignment: Alignment.center,
        child:(widget.image!=null)?  PhotoView(
          backgroundDecoration: const BoxDecoration(
            color: Color(0xfff7f7f7),
          ),
          imageProvider: NetworkImage(widget.image),
        ):Container(),
      ),

    );
  }

}