import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

textdocview(parts) {
  dynamic doclist = parts[2].split('#@#&');
  var value = "";
  if (parts[4] == "doc" || parts[4] == "video") {
    value = doclist[1];
  } else if (parts[4] == "text") {
    value = parts[2];
  }
  return Expanded(
    child: Text(
      value,
      style: TextStyle(
          color: parts[3] != 'send' ? Colors.black : Colors.white,
          fontSize: 16),
      textAlign: TextAlign.left,
    ),
  );
}

