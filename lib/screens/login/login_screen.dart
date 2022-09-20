import 'dart:convert';
import 'dart:io';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:evidya/constants/string_constant.dart';
import 'package:evidya/localization/app_translations.dart';
import 'package:evidya/localization/application.dart';
import 'package:evidya/network/repository/api_repository.dart';
import 'package:evidya/resources/app_colors.dart';
import 'package:evidya/resources/text_styles.dart';
import 'package:evidya/screens/login/forget_password.dart';
import 'package:evidya/screens/login/registration_screen.dart';
import 'package:evidya/sharedpref/constants/preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:evidya/sharedpref/preference_connector.dart';
import 'package:evidya/utils/helper.dart';
import 'package:evidya/utils/size_config.dart';
import 'package:evidya/utils/validator.dart';
import 'package:evidya/widget/gradient_button.dart';
import 'package:evidya/widget/login_app_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

import '../messenger/tabview.dart';
import 'auth.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {


  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList =
      application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };

  String label = languagesList[0];
  String _sdkVersion;
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final loginUserDetails = LoginUserDetails();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final progressKey = GlobalKey();
  String deviceTokenToSendPushNotification = "";
  bool _obscureText = false;
  final _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            // resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Hello again!",
                          style: TextStyle(
                              fontSize: 23.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "Let's continue with \n our learning journey.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Form(
                            key: _formKey,
                            child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.grey)),
                                            child: TextFormField(
                                              controller: _emailController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                focusColor:
                                                Colors.white.withOpacity(0.5),
                                                hintText:
                                                "Enter your registered email",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontSize: 15),
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder
                                                    .none,
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty ||
                                                    !RegExp(
                                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                        .hasMatch(value)) {
                                                  return 'Enter your registered email!';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          // _email(size),
                                          SizedBox(height: 3.h),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            child: TextFormField(
                                              controller: _passwordController,
                                              keyboardType:
                                              TextInputType.visiblePassword,
                                              obscureText: !_obscureText,
                                              decoration: InputDecoration(
                                                filled: true,
                                                focusColor:
                                                Colors.white.withOpacity(0.5),
                                                hintText: "Enter your password",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontSize: 15),
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder
                                                    .none,
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    _obscureText
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _obscureText =
                                                      !_obscureText;
                                                    });
                                                  },
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Enter a valid password!';
                                                } else if (value.length < 8) {
                                                  return 'password must be at least 8 characters.';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          //_password(size),
                                          SizedBox(height: 1.h),
                                          _forgetPassword(size),
                                          SizedBox(height: 3.h),
                                          _submitButton(size),
                                         /* SizedBox(height: 3.h),
                                          _Googlesignup(size)*/
                                        ],
                                      ),
                                      SizedBox(height: 25.h),
                                      _dontHaveAccount(),
                                      //SizedBox(height: 20),
                                      //_buildBody()
                                    ])))
                      ]),
                ))));
  }

  _onEmailChanged() {
    loginUserDetails.userEmail = _emailController.text;
  }

  _onPasswordChanged() {
    loginUserDetails.password = _passwordController.text;
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
      backgroundColor: Colors.pink,
    ));
  }

  final Validator validator = Validator();

  Widget _submitButton(Size size) {
    return GradiantButton(
        buttonName: "Login",
        onPressed: () {
          if (_formKey.currentState.validate()) {
            EasyLoading.show();
            getDeviceTokenToSendNotification();
          } else {}
        });
  }

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token Value $deviceTokenToSendPushNotification");
    PreferenceConnector.setJsonToSharedPreferenceefcmtoken(StringConstant.fcmtoken,deviceTokenToSendPushNotification);
    _loginUser();
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
    _passwordController.addListener(_onPasswordChanged);
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    application.onLocaleChanged = onLocaleChange;
    onLocaleChange(Locale(languagesMap["malay"]));
    super.initState();
  }


  void onLocaleChange(Locale locale) async {
    setState(() {
      AppTranslations.load(locale);
    });
  }

  Widget _forgetPassword(Size size) {
    return GestureDetector(
      child: Container(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text("Forgot Password?",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: AppColors.redColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              )),
        ),
      ),
      onTap: () =>
      {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ForgetPassword()))
      },
    );
  }

  void _loginUser() {
    int deviceType = 0;
    FocusScope.of(context).requestFocus(FocusNode());
    if (Platform.isIOS) {
      print('is a IOS');
      deviceType = 1;
    } else if (Platform.isAndroid) {
      print('is a Andriod');
      deviceType = 2;
    }

    Helper.checkConnectivity().then((value) =>
    {
      if (value)
        {
          ApiRepository()
              .userLogin(_emailController.text, _passwordController.text,
              deviceTokenToSendPushNotification)
              .then((value) async {
            EasyLoading.dismiss();
            print("logindata123 " + value.body.toString());
            if (value != null) {
              if (value.status == "successfull") {
                var loginData = value.body;
                String Data = jsonEncode(value.body);
                print("Dtaayayayaayaya $Data");
                print("DataRole ${loginData.role}");
                PreferenceConnector().setRole(loginData.role);
                PreferenceConnector().setProfileData(loginData.name, loginData.email);
                PreferenceConnector().setProfileImage(loginData.image);
                PreferenceConnector.setJsonToSharedPreference(
                    StringConstant.loginData, loginData.authToken);
                print(
                    "Token ${loginData.authToken} UserId ${loginData.id} ");
                PreferenceConnector.setJsonToSharedPreferencename(
                    StringConstant.Username, loginData.name);
                PreferenceConnector.setJsonToSharedPreferenceemail(
                    StringConstant.email, loginData.email);
                PreferenceConnector.setJsonToSharedPreferencephone(
                    StringConstant.phoneno, loginData.phone);
                PreferenceConnector.setJsonToSharedPreferencetoken(
                    StringConstant.Userdata, Data);
                PreferenceConnector().setLoginData(true);
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute( builder: (context) => messengertab()),
                        (Route<dynamic> route) => false);
              } else {
                EasyLoading.showToast(value.message,
                    toastPosition: EasyLoadingToastPosition.bottom);
                //showInSnackBar(value.message);
              }
            } else {
              showInSnackBar(
                  AppTranslations.of(context).text("Something went wrong"));
            }
          })
        }
      else
        {EasyLoading.dismiss(), Helper.showNoConnectivityDialog(context)}
    });
  }

  Widget _dontHaveAccount() {
    return GestureDetector(
        onTap: () {
          print("Container clicked");
          /*Navigator.of(context).pushNamedAndRemoveUntil(
              PageRouteConstants.registration_screen,
              (Route<dynamic> route) => false);*/
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RegistrationScreen()));
        },
        child: Container(
          width: double.infinity,
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Don't have an account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        )),
                    Text("Create",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.redColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ])),
        ));
  }

  _Googlesignup(Size size) {
    return InkWell(
      child: Container(
          margin: const EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.black),
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/google.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ))),
      onTap: () async {
        _onPressedLogInButton();
        // _onPressedExpressLogInButton(context);
        signInWithGoogle().whenComplete(() {
          /*Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ),
          )*/;
        });
      },
    );
  }



  Future<String> _onPressedLogInButton() async {
    final result = await FacebookAuth.instance.login();
    print(result);
          final userData = await FacebookAuth.instance.getUserData();
         dynamic _userData = userData;
         print(_userData);

    }

}

class LoginUserDetails {
  String userEmail;
  String password;
}
