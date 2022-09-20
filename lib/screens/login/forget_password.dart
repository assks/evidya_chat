
import 'package:evidya/constants/color_constant.dart';
import 'package:evidya/constants/font_constants.dart';
import 'package:evidya/constants/page_route_constants.dart';
import 'package:evidya/constants/string_constant.dart';
import 'package:evidya/localization/app_translations.dart';
import 'package:evidya/network/repository/api_repository.dart';
import 'package:evidya/resources/app_colors.dart';
import 'package:evidya/resources/text_styles.dart';
import 'package:evidya/screens/login/login_screen.dart';
import 'package:evidya/utils/helper.dart';
import 'package:evidya/utils/size_config.dart';
import 'package:evidya/widget/back_toolbar_with_center_title.dart';
import 'package:evidya/widget/gradient_button.dart';
import 'package:evidya/widget/login_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final loginUserDetails = LoginUserDetails();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final progressKey = GlobalKey();
  final _emailFocus = FocusNode();
  ProgressDialog _progressDialog = ProgressDialog();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill
    ),),
    child:
      Scaffold(
       backgroundColor: Colors.transparent,
        key: _scaffoldKey,

        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Padding(
                 padding: EdgeInsets.only(top: 40,left: 20),
                 child:  Align(
                   alignment: Alignment.centerLeft,
                   child: IconButton(
                     icon: Icon(
                       Icons.keyboard_backspace,
                       color: Colors.black,
                     ),
                     onPressed: () =>
                         Navigator.of(context).pop(),
                   ),
                 )
               ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 10, bottom: 30, right: 20),
                  child: HeadingAppBar(
                    title: StringConstant.forgetPassword,
                    sizes: 20,
                    padding_top: 5,
                    description:
                    "Enter the email associated with your account and we'll send  an email with instructions to reset your password.",
                    description_size: 13,
                  ),
                ),
                Center(
                    child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                        height:
                                        30),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(width: 1,color: Colors.black)
                                      ),
                                      child: TextFormField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          focusColor: Colors.white.withOpacity(0.5),
                                          hintText: "Email",
                                          suffixIcon: Icon(Icons.mail),
                                          hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 15),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty ||
                                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(value)) {
                                            return 'Enter a valid email!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                        getProportionateScreenHeight(30)),
                                    _submitButton(size)
                                  ],
                                ),
                              ),
                            ])))
              ]),
        )
      )
    );
  }

  _onEmailChanged() {
    loginUserDetails.userEmail = _emailController.text;
    if (loginUserDetails.userEmail.isNotEmpty) {}
  }

  Widget _email(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          StringConstant.email,
          style: AppTextStyles.getMediumText(
              size.width, AppColors.black, FontConstant.kBold),
        ),
        TextField(
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          controller: _emailController,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.email),
          ),
          style: AppTextStyles.getLargeText(
              size.width, AppColors.black, FontConstant.kRegular),
        ),
      ],
    );
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
      backgroundColor: Colors.pink,
    ));
  }

  Widget _submitButton(Size size) {
    return GradiantButton(
        buttonName: "Submit",
        onPressed: () {
          if (_emailController.text.isEmpty) {
            showInSnackBar('Please enter the email address.');
          } else if (!_emailController.text.contains('@')) {
            showInSnackBar('Please enter valid email address');
          } else {
            EasyLoading.show();
            forgetPasswordApiCall();
          }
        });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _emailController.addListener(_onEmailChanged);
    super.initState();
  }

  void forgetPasswordApiCall() {
    FocusScope.of(context).requestFocus(FocusNode());
    Helper.checkConnectivity().then((value) => {
          if (value)
            {
              ApiRepository().forgetPasswordApiCall(_emailController.text)
                  .then((value) {
                  EasyLoading.dismiss();
                if (value != null) {
                  if (value.status == "successfull") {

                    //Helper.showMessage("Successfully sent . Please check your registered mail id. ");
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: new Container(
                              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                              width: 300.0,
                              height: 350.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.transparent,
                                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/images/whitebackground.png")
                                ),
                              ),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/images/Smile.png",height: 10.h,),
                                  SizedBox(height: 15,),
                                  Text("Congratulations!",style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Color(0xFF1da1f2),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .5
                                  ),),
                                  SizedBox(height: 5,),
                                  Text("Your Password change request has been submitted successfully.\n Please check your email.",style: TextStyle(
                                      fontSize: 10.sp,
                                      letterSpacing: .5
                                  ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 15,),
                                  GestureDetector(
                                      onTap: (){
                                        //isShow = false;
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) => LoginScreen(),
                                          ), (route) => false,
                                        );
                                      },
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFF450d35),
                                                Color(0xFF4a0d36),
                                                Color(0xFF4e1141),
                                                Color(0xFF520e35),
                                                Color(0xFF520e35),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child:  Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 10, bottom: 10),
                                              child: Text(
                                                "Tap to login",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: .5
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),)),
                                ],
                              ),
                            ),
                          );
                        });

                  } else {
                    showInSnackBar(value.message.toString());
                  }
                }
              })
            }
          else
            {Helper.showNoConnectivityDialog(context)}
        });
  }
}
