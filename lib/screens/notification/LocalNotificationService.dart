
import 'dart:async';

import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

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
            bigPicture: message.data['image'],
            notificationLayout: NotificationLayout.BigPicture
        ),
      );
    }else{
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: int.parse(message.from.substring(message.from.length - 3)),
          channelKey: 'basic_channel',
          title: message.data['title']+"      "+_messageIncrement.toString(),
          body: message.data['body'],
          wakeUpScreen: true,
        ),
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
            payload: {'username': message['title'],'callid': message['call_id'],
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
}
