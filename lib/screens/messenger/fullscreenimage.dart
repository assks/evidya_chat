import 'dart:io';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';

class FullScreenImage extends StatefulWidget {
  final dynamic image;
  const FullScreenImage({this.image,Key key}) : super(key: key);

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold (
       appBar: AppBar(
           backgroundColor: AppColors.appNewDarkThemeColor,
           leading: Align(
             alignment: Alignment.centerLeft,
             child: IconButton(
               icon: const Icon(Icons.keyboard_backspace,color: Colors.white,),
               onPressed: (){
                 Navigator.pop(context);
               },
             ),
           ),
           centerTitle: true,title: const Text("Image")),
       body: PhotoView(
    imageProvider: FileImage(File(widget.image)),
     ));


  }
}
