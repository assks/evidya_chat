import 'package:evidya/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GradiantButton extends StatelessWidget {
  final String buttonName;
  final GestureTapCallback onPressed;


  GradiantButton({Key key, @required this.buttonName, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Center(
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.appNewDarkThemeColor,
                      AppColors.appNewLightThemeColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      buttonName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        letterSpacing: .5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}
