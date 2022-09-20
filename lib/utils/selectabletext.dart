import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Selectable_Text{
  static seleted_text(text) {
    Center(
      child: SelectableText.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(text: 'Flutter', style: TextStyle(color: Colors.blue)),
          ],
        ),
        textAlign: TextAlign.center,
        toolbarOptions: ToolbarOptions(copy: true, selectAll: false),
        showCursor: true,
        cursorWidth: 2,
        cursorColor: Colors.black,
        cursorRadius: Radius.circular(5),
      ),
    );
  }
}