// ignore_for_file: unused_field, file_names

import 'package:flutter/material.dart';
import 'package:heraggoods/customer/models/ImageModel.dart';
 import 'package:photo_view/photo_view.dart';


// ignore: must_be_immutable
class ImageZoom extends StatelessWidget{

  final List<ImageModel> images;
  final int index;
  String _current="";
  final ValueNotifier _notifier=  ValueNotifier<int>(0);
 late  PageController _controller ;
  ImageZoom(this.images,this.index, {super.key}){
    _controller=  PageController(initialPage: index);
    _current= images[index].url;
  }


  _setChangeImage(index){
    _current=images[index].url;
    _notifier.value=index;
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.black87,
      appBar:AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: InkWell(
          child:const Icon(Icons.arrow_back_ios,size: 25,color: Colors.white,),
          onTap: (){Navigator.of(context).pop();},
        ),
        

      ),

      body: PageView(
        controller: _controller,
        onPageChanged: _setChangeImage,
        children: List.generate(images.length, (index){
          return Container(
            alignment: Alignment.center,
            child: PhotoView(
              backgroundDecoration:const BoxDecoration(
                color: Colors.black87,
              ),
              imageProvider: NetworkImage(images[index].url),
            ),
          );
        }),
      ),

    );
  }
}
