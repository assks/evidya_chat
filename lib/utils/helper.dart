import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:evidya/constants/color_constant.dart';
import 'package:evidya/constants/string_constant.dart';
import 'package:evidya/model/login/PrefranceData.dart';
import 'package:evidya/network/repository/api_repository.dart';
import 'package:evidya/resources/app_colors.dart';
import 'package:evidya/resources/dimens.dart';
//import 'package:evidya/screens/broadcast/CallPage.dart';
import 'package:evidya/sharedpref/preference_connector.dart';
//import 'package:share/share.dart';
import 'package:evidya/utils/selectabletext.dart';
import 'package:evidya/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../screens/messenger/tabview.dart';

class Helper {
  static printLogValue(dynamic value) {}

  static void showMessage(String message) {

  }







  static _onShareWithEmptyFields(BuildContext context, String id,String type) async {
    Helper.checkConnectivity().then((value) =>
    {
      if (value)
        {
          PreferenceConnector.getJsonToSharedPreference(
              StringConstant.Userdata)
              .then((value) =>
          {
            if (value != null)
              {
                userdata = jsonDecode(value.toString()),
                localdata = PrefranceData.fromJson(userdata),
                FlutterShare.share(
                  title: 'Meeting Id',
                  text: '${localdata.name} just invited you to a bvidya $type.\n'
                  '$type code -$id\n'
                  'To join, copy the code and enter it on the bvidya app or website.'
                  ),
              }
            else
              {
                Helper.showMessage(
                    "Something went wrong please logout and login again.")
              }
          })
        }

    });

  }


  static Future<bool> checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        Helper.printLogValue('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      Helper.printLogValue('not connected');
      return false;
    }
  }

  static showNoConnectivityDialog(BuildContext buildContext) {
    Alert(
      context: buildContext,
      type: AlertType.error,
      title:
      "You are disconnected to the Internet. Please check your internet connection",
      buttons: [
        DialogButton(
          child: Text(
            "Close",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            exit(0);
          },
          color: Colors.black,
        ),
      ],
    ).show();
  }



  static Widget onScreenProgress() {
    return Container(
      height: getProportionateScreenHeight(10),
      width: getProportionateScreenWidth(9),
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor:
          new AlwaysStoppedAnimation<Color>(ColorConstant.buttonPink),
        ),
      ),
    );
  }


}

var localdata;
String rtm_userName, rtm_Token;
dynamic userdata ,userName;
int userid,rtm_userID;




 getRTMUserNameAndToken(cnx) {
  Helper.checkConnectivity().then((value) =>
  {
    if (value)
      {
        //EasyLoading.show(),
        PreferenceConnector.getJsonToSharedPreference(
            StringConstant.Userdata)
            .then((value) =>
        {
          if (value != null)
            {
              userdata = jsonDecode(value.toString()),
              localdata = PrefranceData.fromJson(userdata),
              print("LocalData ${localdata.id}"),
              rtm_userID = 1000000 + localdata.id,
              print("Rtm USer ID $rtm_userID"),
              ApiRepository().rtmFetchUserName(
                  localdata.authToken,
                  rtm_userID.toString(),
                  localdata.name)
                  .then((value) {
                EasyLoading.dismiss();
                // _progressDialog.dismissProgressDialog(cnx);
                if (value != null) {
                  if (value.rtmToken != null) {
                    rtm_Token = value.rtmToken;
                    rtm_userName = value.rtmUser;
                    print("RTM TOKEN $rtm_Token && RTM USerName $rtm_userName");
                  } else {
                    Helper.showMessage(
                        "Something getting wrong!");
                  }
                }
              })
            }
          else
            {
              Helper.showMessage(
                  "Something getting wrong!")
            }
        })
      }
    else
      {Helper.showNoConnectivityDialog(cnx)}
  });
}


 Future<void> _handleCameraAndMic(Permission permission) async {
  final status = await permission.request();
  print(status);
}

