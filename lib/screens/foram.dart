import 'package:evidya/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Foram extends StatefulWidget {
  const Foram({Key key}) : super(key: key);

  @override
  _ForamState createState() => _ForamState();
}

class _ForamState extends State<Foram> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            /*borderRadius: BorderRadius.all(Radius.circular(40)
              *//*topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)*//*),*/
            image: DecorationImage(
              image: AssetImage("assets/images/whitebackground.png"),
              fit: BoxFit.cover,
            )),
     child: Center(child: Text("Comming Soon...",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),))
    );
  }
}
