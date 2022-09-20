import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'dimens.dart';


class AppTextStyles {
  static TextStyle appBarTextStyleTheme(bool isDark) =>
      TextStyle(color: isDark ? AppColors.white : AppColors.black);

  /*-----------------------Text Style BOLD -----------------------*/
  static TextStyle getExtraSmallText(double width, Color color, int fontType) {
    return TextStyle(
      color: color,
      fontFamily: 'lexend' ,
      fontSize: (width * 0.025 < Dimens.px14 ? width * 0.025 : Dimens.px13),
    );
  }

  static TextStyle getSmallText(double width, Color color, int fontType) {
    return TextStyle(
      color: color,
      fontFamily: 'lexend' ,
      fontSize: (width * 0.038 < Dimens.px18 ? width * 0.038 : Dimens.px17),
    );
  }

  static TextStyle getMediumText(double width, Color color, int fontType) {
    return TextStyle(
      color: color,
      fontFamily: 'lexend' ,
      fontSize: (width * 0.044 < Dimens.px22 ? width * 0.044 : Dimens.px21),
    );
  }

  static TextStyle getLargeText(double width, Color color, int fontType) {
    return TextStyle(
      color: color,
      fontFamily: 'lexend' ,
      fontSize: (width * 0.053 < Dimens.px26 ? width * 0.053 : Dimens.px25),
    );
  }

  static TextStyle getExtraLargeText(double width, Color color, int fontType) {
    return TextStyle(
      color: color,
      fontFamily: 'lexend' ,
      fontSize: (width * 0.062 < Dimens.px30 ? width * 0.062 : Dimens.px29),
    );
  }

  static TextStyle getSmallTextUnderline(
      double width, Color color, int fontType, bool underline) {
    return TextStyle(
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      color: color,
      fontFamily: 'lexend' ,
      fontSize: (width * 0.032 < Dimens.px18 ? width * 0.032 : Dimens.px17),
    );
  }

  static TextStyle getMedium1Text(double width, Color color, int fontType) {
    return TextStyle(
      color: color,
      fontFamily: 'lexend' ,
      fontSize: (width * 0.053 < Dimens.px14 ? width * 0.053 : Dimens.px13),
    );
  }
}
