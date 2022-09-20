import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData appTheme() {
    return ThemeData(
        primaryColor: Colors.grey,
        backgroundColor: Colors.grey,
        fontFamily: 'lexend' ,
        textTheme: TextTheme(
            subtitle1: TextStyle(color: AppColors.black),
            caption: TextStyle(color: AppColors.white)),
            brightness: Brightness.light,
       );
  }
}
