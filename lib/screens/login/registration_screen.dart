import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:evidya/constants/font_constants.dart';
import 'package:evidya/constants/page_route_constants.dart';
import 'package:evidya/constants/profile_constant.dart';
import 'package:evidya/constants/string_constant.dart';
import 'package:evidya/localization/app_translations.dart';
import 'package:evidya/model/registrationUserDetails.dart';
import 'package:evidya/network/repository/api_repository.dart';
import 'package:evidya/resources/app_colors.dart';
import 'package:evidya/resources/text_styles.dart';
import 'package:evidya/screens/login/login_screen.dart';
import 'package:evidya/utils/helper.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:evidya/utils/size_config.dart';
import 'package:evidya/utils/validator.dart';
import 'package:evidya/widget/custom_text_field.dart';
import 'package:evidya/widget/gradient_button.dart';
import 'package:evidya/widget/login_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';


class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailController = new TextEditingController();
  final _nameController = new TextEditingController();
  final _phonenoController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _confirmPasswordController =  TextEditingController();
  final _otpController =  TextEditingController();
  final registrationUserDetails = RegistrationUserDetails();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final progressKey = GlobalKey();
  var url;
  bool isProfileAvailable = true;
  String profilePic = "";
  String profileType = ProfileConstant.LETTER;
  String clientToken;
  bool _obsure_resend_otp=false;

  //LoginData loginData;
  bool _obscureText = false;
  bool _confPass = false;
  var currentClass;
  ProgressDialog _progressDialog = ProgressDialog();
  final _stopWatchTimer = StopWatchTimer(
    onChange: (value) {
      final displayTime = StopWatchTimer.getDisplayTime(value);
      // print('displayTime $displayTime');
    },
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final value = 5;
    final displayTime = StopWatchTimer.getDisplayTime(value,
        hours: true, second: true, milliSecond: false);

    return Container(
      height: size.height,
      padding: const EdgeInsets.only(top: 30),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.png",),
            fit: BoxFit.fill
        ),),
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,

          body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h,),
                    Text("Create an account",
                      style: TextStyle(fontSize: 23.sp,
                          fontWeight: FontWeight.bold),),
                    SizedBox(height: 1.h,),
                    SizedBox(height: 2.h,),
                    Form(
                        key: _formKey,
                        child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                mainAxisAlignment: MainAxisAlignment
                                    .center,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                            border: Border.all(width: 1,color:Colors.grey)
                                        ),
                                        child: TextFormField(
                                          controller: _nameController,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            filled: true,
                                            focusColor: Colors.white,
                                            hintText: "Full Name",
                                            hintStyle: TextStyle(color: Colors.grey,
                                                fontSize: 15),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter full name.';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                       SizedBox(height: 2.h),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                            border: Border.all(width: 1,color:Colors.grey)
                                        ),
                                        child: TextFormField(
                                          controller: _emailController,
                                          decoration: const InputDecoration(
                                            filled: true,
                                            focusColor: Colors.white,
                                            hintText: "Email",
                                            hintStyle: TextStyle(color: Colors.grey,
                                                fontSize: 15),
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
                                       SizedBox(height: 2.h),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5),
                                                border: Border.all(width: 1,color:Colors.grey)
                                            ),
                                            child: TextFormField(
                                              controller: _phonenoController,
                                              keyboardType: TextInputType.number,
                                              onChanged: (content) {
                                               if(content.length>=10){
                                                 _stopWatchTimer.rawTime.listen((value) =>
                                                     print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
                                                 SendOTP();
                                                 _obsure_resend_otp=true;
                                               }
                                              },
                                              decoration: const InputDecoration(
                                                filled: true,
                                                focusColor: Colors.white,
                                                hintText: "Mobile Number",

                                                hintStyle: TextStyle(color: Colors.grey,
                                                    fontSize: 15),
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Enter a mobile number.';
                                                } else if(value.length != 10){
                                                  return 'Please enter 10 digit number.';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          Visibility(
                                              visible: _obsure_resend_otp,
                                              child: Row(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                           crossAxisAlignment: CrossAxisAlignment.end,
                                           children: [
                                            // Text(displayTime),
                                             GestureDetector(
                                               onTap: (){
                                                 SendOTP();
                                               },
                                               child: const Text("Resend OTP",style: TextStyle(color: Colors.red,fontSize: 14)),
                                             ),
                                           ],
                                         )
                                          )
                                        ],
                                      ),
                                       SizedBox(height: 2.h),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                            border: Border.all(width: 1,color:Colors.grey)
                                        ),
                                        child: TextFormField(
                                          controller: _passwordController,
                                          keyboardType: TextInputType.visiblePassword,
                                          obscureText: !_obscureText,
                                          decoration: InputDecoration(
                                            filled: true,
                                            focusColor: Colors.white,
                                            hintText: "Password",
                                            hintStyle: TextStyle(color: Colors.grey,
                                                fontSize: 15),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            suffixIcon: IconButton(
                                              icon:  Icon(
                                                _obscureText
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                size: 20,),
                                              onPressed: (){
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter a valid password!';
                                            } else if(value.length<8)
                                            {
                                              return 'password must be at least 8 characters.';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                       SizedBox(height: 2.h),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                            border: Border.all(width: 1,color:Colors.grey)
                                        ),
                                        child: TextFormField(
                                          controller: _confirmPasswordController,
                                          keyboardType: TextInputType.visiblePassword,
                                          obscureText: !_confPass,
                                          decoration: InputDecoration(
                                            filled: true,
                                            focusColor: Colors.white,
                                            hintText: "Confirm Password",
                                            hintStyle: TextStyle(color: Colors.grey,
                                                fontSize: 15),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            suffixIcon: IconButton(
                                              icon:  Icon(
                                                _confPass
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                size: 20,),
                                              onPressed: (){
                                                setState(() {
                                                  _confPass = !_confPass;
                                                });
                                              },
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter a valid password!';
                                            } else if(value.length<8) {
                                              return 'password must be at least 8 characters.';
                                            } else if(_passwordController.text!= _confirmPasswordController.text){
                                              return "Password does not match";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(width: 1,color:Colors.grey)
                                        ),
                                        child: TextFormField(
                                          controller: _otpController,
                                          keyboardType: TextInputType.number,
                                          obscureText: !_obscureText,
                                          decoration: InputDecoration(
                                            filled: true,
                                            focusColor: Colors.white,
                                            hintText: "OTP",
                                            hintStyle: const TextStyle(color: Colors.grey,
                                                fontSize: 15),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            suffixIcon: IconButton(
                                              icon:  Icon(
                                                _obscureText
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                size: 20,),
                                              onPressed: (){
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter a valid OTP!';
                                            } else if(value.length<4)
                                            {
                                              return 'OTP must be at least 6 characters.';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                       SizedBox(height: 4.h),
                                      _submitButton(size),
                                       SizedBox(height: 2.h),
                                      _termcondiction()
                                    ],
                                  ),
                                   SizedBox(
                                      height:
                                      4.h),
                                  _alreadyHaveAnAccount()
                                ])))
                  ]))),
    );

  }

  _onEmailChanged() {
    registrationUserDetails.userEmail = _emailController.text;
    if (registrationUserDetails.userEmail.isNotEmpty) {}
  }

  _onPasswordChanged() {
    registrationUserDetails.password = _passwordController.text;
    if (registrationUserDetails.password.isNotEmpty) {}
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(value),
      backgroundColor: Colors.pink,
    ));
  }

  final Validator validator = Validator();

  Widget _submitButton(Size size) {
    return GradiantButton(
        buttonName: "Sign Up",
        onPressed: () {
          if(_formKey.currentState.validate()){
            EasyLoading.show();
           _registerUser();
         }
          else {
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
    currentClass = this.runtimeType;
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    super.initState();
  }

  void _registerUser() {
    FocusScope.of(context).requestFocus(FocusNode());
    Helper.checkConnectivity().then((value) =>
    {
      if (value)
        {
          ApiRepository().userRegistration(_nameController.text, _phonenoController.text, _emailController.text, _passwordController.text, _confirmPasswordController.text).then((value) {
            if (value != null) {
              if (value.status == "successfull") {
                EasyLoading.dismiss();
                // print("------response-------" + value.data.bearerToken);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child:  Container(
                          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                          width: 260.0,
                          height: 300.0,
                          decoration:  const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.transparent,
                            borderRadius:  BorderRadius.all( Radius.circular(10.0)),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/whitebackground.png")
                            ),
                          ),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/images/Smile.png",height: 10.h,),
                              const SizedBox(height: 15,),
                              Text("Congratulations!",style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Color(0xFF1da1f2),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .5
                              ),),
                              const SizedBox(height: 5,),
                              Text("You have successfully created your account.",style: TextStyle(
                                  fontSize: 10.sp,
                                  letterSpacing: .5
                              ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 15,),
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
              }
              else {
                EasyLoading.dismiss();
                EasyLoading.showToast("${value.message}",toastPosition: EasyLoadingToastPosition.bottom);
                //showInSnackBar(value.message);
              }
            } else {
              EasyLoading.dismiss();
              EasyLoading.showToast("Something went wrong! ",toastPosition: EasyLoadingToastPosition.bottom);
              //showInSnackBar(value.message);
            }
          }
          )
        }
      else
        {
          EasyLoading.dismiss(),
          Helper.showNoConnectivityDialog(context)
        }
    }

    );
  }

  void SendOTP() {
    FocusScope.of(context).requestFocus(FocusNode());
    Helper.checkConnectivity().then((value) =>
    {
      if (value)
        {
          ApiRepository().Otpvalidaction( _phonenoController.text).then((value) {
            if (value != null) {
              if (value.status == "successfull") {
                EasyLoading.showToast(value.message,toastPosition: EasyLoadingToastPosition.bottom,duration: const Duration(milliseconds: 10000));
              }
              else {
                EasyLoading.dismiss();
                EasyLoading.showToast("${value.message}",toastPosition: EasyLoadingToastPosition.bottom,duration: const Duration(milliseconds: 500));
                //showInSnackBar(value.message);
              }
            } else {
              EasyLoading.dismiss();
              EasyLoading.showToast("Something went wrong! ",toastPosition: EasyLoadingToastPosition.bottom);
              //showInSnackBar(value.message);
            }
          }
          )
        }
      else
        {
          EasyLoading.dismiss(),
          Helper.showNoConnectivityDialog(context)
        }
    }

    );
  }

  Widget _termcondiction() {
    return GestureDetector(
      onTap: () {
        print("Container clicked");
        Navigator.of(context).pushNamed(PageRouteConstants.login_screen);
      },
      child:  Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("By continuing Sign up you are agree to following ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.gray,
                        fontSize: getProportionateScreenWidth(11),
                        fontWeight: FontWeight.w400,
                      )),

                ]),
            Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" Term & Conditions ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.redColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                  Text("without reservation",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.gray,
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w400,
                      )),
                ]),
          ],
        ),
        )
    );
  }

  Widget _alreadyHaveAnAccount() {
    return GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen(),
            ), (route) => false,
          );
        },
        child:  SizedBox(
          width: double.infinity,
          child: Center(
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Have an account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(width: 20.w,),
                Text("Log In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.redColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    )),
              ])),
        ));
  }
}
