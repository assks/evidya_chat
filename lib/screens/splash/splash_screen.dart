import 'dart:convert';

import 'package:evidya/constants/page_route_constants.dart';
import 'package:evidya/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> animation;

  final List<String> imageList = [
    "https://bvidya.websites4demo.com/temporary/banners/1-min.png",
    'https://bvidya.websites4demo.com/temporary/banners/2-min.png',
    'https://bvidya.websites4demo.com/temporary/banners/3-min.png',
  ];

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  _startAnimation() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    print("IsLogin $isLogin");
    if(isLogin)
    {
      Navigator.of(context).pushNamedAndRemoveUntil(
          PageRouteConstants.bottom_navigaction,
              (Route<dynamic> route) => false);
    }
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 6000));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut)
          ..addListener(() {
            if (animationController.isCompleted) {
              /*if(isLogin)
              {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    PageRouteConstants.bottom_navigaction,
                        (Route<dynamic> route) => false);
            }
            else
            {*/
            Navigator.of(context).pushNamedAndRemoveUntil(
            PageRouteConstants.welcome_screen,
            (Route<dynamic> route) => false);
           // }
                  }
              setState(() {});
              });
              animationController.forward();
            }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage("assets/images/logoloader.gif",),
                fit: BoxFit.fill
            )
        ),
      ),
    );
  }

}
