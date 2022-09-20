
import 'package:evidya/constants/page_route_constants.dart';
import 'package:evidya/resources/app_colors.dart';
// import 'package:evidya/screens/login/components/login_gradiant_button.dart';
// import 'package:evidya/screens/login/login_screen.dart';
import 'package:evidya/utils/SizeConfigs.dart';
import 'package:evidya/widget/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';



class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String button = "register";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill
          ),),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/welcome.png",
                    ),
                    fit: BoxFit.fill,
                  )
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 80, right: 80),
                    child: Text("Your Expert Learning Partner",
                       textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Text(
                      "Everything you need to reach the next level of your academic career.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: 60.w,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.white),
                  borderRadius: BorderRadius.circular(10)
                ),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          width:29.w,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: button == "register"? Colors.white
                                  :Colors.transparent
                          ),
                          child: Text("Register",style: TextStyle(
                              color: AppColors.redColor,
                              fontSize: 13.sp
                          ),),
                        ),
                        onTap: (){
                          setState(() {
                            button = "register";
                          });
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              PageRouteConstants.registration_screen,
                                  (Route<dynamic> route) => false);
                        },
                      ),
                      GestureDetector(
                         child: Container(
                           width:30.w,
                           alignment: Alignment.center,
                           padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: button == "register"
                                   ? Colors.transparent
                                   : Colors.white
                           ),
                           child: Text("Log In",style: TextStyle(
                               color: AppColors.redColor,
                               fontSize: 13.sp
                           ),),
                         ),
                        onTap: (){
                           setState(() {
                             button = "sign In";
                           });
                           Navigator.of(context).pushNamedAndRemoveUntil(
                                         PageRouteConstants.login_screen,
                                             (Route<dynamic> route) => false);

                           /*Navigator.of(context)
                               .push(MaterialPageRoute(builder: (context) => demo()));*/
                        },
                      )

                    ],
                  )),

            ],
          ),
        ),
      ),
    );
  }

  /*void retriveLink() async {
    final PendingDynamicLinkData data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    print("-------------------------" + deepLink.path);
  }*/
}
