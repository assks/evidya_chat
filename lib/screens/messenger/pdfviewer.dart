import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

import '../../resources/app_colors.dart';

class Pdfviewer extends StatefulWidget {
  final String pdfpath;

   Pdfviewer({this.pdfpath, Key key}) : super(key: key);

  @override
  State<Pdfviewer> createState() => _PdfviewerState();
}

class _PdfviewerState extends State<Pdfviewer> {
  dynamic  pdffilepath=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     pdffilepath = widget.pdfpath.split('#@#&');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appNewDarkThemeColor,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(Icons.keyboard_backspace,color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        centerTitle: true,title: Text(pdffilepath[1])),
        body: PdfView(path: pdffilepath[0]));
  }
}
