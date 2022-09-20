import 'package:flutter/material.dart';

class GradiantButton extends StatelessWidget {
  final String buttonName;
  final GestureTapCallback onPressed;
  final Color color1;
  final Color color2;
  final Color textcolor;

  GradiantButton({Key key, @required this.buttonName, @required this.onPressed,@required this.color1,@required this.color2,@required this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Center(
            child: Container(
          padding: new EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color1!=null?color1:Colors.black,
                  color2!=null?color1:Colors.grey,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  buttonName,
                  style: TextStyle(
                    color: textcolor,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        )));
  }
}
