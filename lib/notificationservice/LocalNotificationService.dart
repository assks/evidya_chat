
import 'dart:async';
import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:firebase_messaging_platform_interface/src/remote_message.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';

import '../constants/string_constant.dart';

class LocalNotificationService{
///  after this create a method initialize to initialize  localnotification

  static void initialize() {
  }

 /// after initialize we create channel in createanddisplaynotification method

  static int _messageIncrement = 0;
  static Future<void> showNotification(dynamic message) async {
    _messageIncrement++;
    if(message.data['image']!="") {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: int.parse(message.from.substring(message.from.length - 3)),
            channelKey: 'basic_channel',
            title: message.data['title']+"      "+_messageIncrement.toString(),
            body: message.data['body'],
            wakeUpScreen: true,
            fullScreenIntent: true,
            bigPicture: message.data['image'],
            notificationLayout: NotificationLayout.BigPicture,
            payload: {
            'peerid': message.data['call_id'],
            }
        ),
      );
    }else{
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: int.parse(message.from.substring(message.from.length - 3)),
          channelKey: 'basic_channel',
          title: message.data['title']+"      "+_messageIncrement.toString(),
          body: message.data['body'],
            fullScreenIntent: true,
          wakeUpScreen: true,
          payload: {
            'peerid': message.data['call_id'],
            'name': message.data['title']
          }
        )
      );
    }
  }
  static Future<void> showCallNotification(dynamic message) async {
    String platformVersion = 'Android-31';
    AndroidForegroundService.startForeground(
        content: NotificationContent(
            id: 1,
            channelKey: 'call_channel',
            title: message['body'] =='video'? 'bVidya Video Call': 'bVidya Audio Call',
            body: message['title'],
            largeIcon: 'asset://assets/images/teacher.PNG',
            wakeUpScreen: true,
            fullScreenIntent: true,
            autoDismissible: false,
            backgroundColor: (platformVersion == 'Android-31') ? Color(0x00796a) : Colors.white,
            payload: {
              'username': message['title'],
              'callid': message['call_id'],
              'calltype':message['body'],
              'fcmtoken':message['fcm_token']
            }
        ),
        actionButtons: [
          NotificationActionButton(
              key: 'ACCEPT',
              label: 'Accept Call',
              color: Colors.green,
              autoDismissible: true
          ),
          NotificationActionButton(
              key: 'REJECT',
              label: 'Reject',
            color: Colors.red,
             // isDangerousOption: true,
              autoDismissible: true,
           // buttonType: ActionButtonType.DisabledAction,
          ),
        ]
    );
    Timer.periodic(const Duration(seconds: 60), (timer) {
      AndroidForegroundService.stopForeground();

    });
   // AndroidForegroundService.stopForeground();
  }



  static void callkitNotification(RemoteMessage message) async {
    var params = <String, dynamic>{
      'id': message.data['call_id'],
      'nameCaller': message.data['title'],
      'appName': 'Bvidya',
      'avatar': StringConstant.IMAGE_URL+message.data['userprofile'],
      'handle': message.data['body'],
      'type': 0,
      'textAccept': 'Accept',
      'textDecline': 'Decline',
      'textMissedCall': 'Missed call',
      'textCallback': 'Call back',
      'duration': 30000,
      'extra': <String, dynamic>{'username': message.data['title'], 'callid': message.data['call_id'], 'calltype':message.data['body'], 'fcmtoken':message.data['fcm_token']},
      'headers': <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
      'android': <String, dynamic>{
        'isCustomNotification': true,
        'isShowLogo': false,
        'isShowCallback': false,
        'isShowMissedCallNotification': true,
        'ringtonePath': 'system_ringtone_default',
        'backgroundColor': '#ADD8E6',
        //'backgroundUrl': 'https://i.pravatar.cc/500',
        'actionColor': '#4CAF50'
      },
      'ios': <String, dynamic>{
        'iconName': 'CallKitLogo',
        'handleType': 'generic',
        'supportsVideo': true,
        'maximumCallGroups': 2,
        'maximumCallsPerCallGroup': 1,
        'audioSessionMode': 'default',
        'audioSessionActive': true,
        'audioSessionPreferredSampleRate': 44100.0,
        'audioSessionPreferredIOBufferDuration': 0.005,
        'supportsDTMF': true,
        'supportsHolding': true,
        'supportsGrouping': false,
        'supportsUngrouping': false,
        'ringtonePath': 'system_ringtone_default'
      }
    };
    await FlutterCallkitIncoming.showCallkitIncoming(params);
  }

  static void misscallkitNotification(RemoteMessage message) async{
    var misscall = <String, dynamic>{
      'id': message.data['call_id'],
      'nameCaller': message.data['title'],
      'handle': message.data['body'],
      'type': 1,
      'textMissedCall': 'Missed call',
      'textCallback': 'Call back',
      'extra': <String, dynamic>{'userId': '1a2b3c4d'},
    };
    await FlutterCallkitIncoming.showMissCallNotification(misscall);
  }

  }
