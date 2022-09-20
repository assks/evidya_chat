import 'dart:async';
import 'dart:io';

// Import package
import 'package:evidya/screens/messenger/chat_screen.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:event_bus/event_bus.dart';
import 'package:evidya/localdb/databasehelper.dart';
import 'package:evidya/network/repository/api_repository.dart';
import 'package:evidya/notificationservice/LocalNotificationService.dart';
import 'package:evidya/resources/app_colors.dart';
import 'package:evidya/screens/livestreaming/broadcast/TestLiveStream.dart';
import 'package:evidya/screens/livestreaming/broadcast/audiocallpage.dart';
import 'package:evidya/screens/splash/splash_screen.dart';
import 'package:evidya/sharedpref/preference_connector.dart';
import 'package:evidya/utils/helper.dart';
import 'package:evidya/utils/screen_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'constants/string_constant.dart';
import 'localization/app_translations_delegate.dart';
import 'localization/application.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/messenger/logs.dart';
import 'screens/messenger/tabview.dart';
EventBus eventBus = EventBus();
Future<void> backgroundHandler(RemoteMessage message) async {

  print('listen a terminate message ${message.data}');
  var type = message.data['type'];
  if (type == 'basic_channel') {
      LocalNotificationService.showNotification(message);
  } else if (type == 'call_channel') {
  //  LocalNotificationService.showCallNotification(message.data);
    LocalNotificationService.callkitNotification(message);
   // LocalNotificationService.misscallkitNotification(message);

  } else if (type == 'cut') {
    await FlutterCallkitIncoming.endAllCalls();
    PreferenceConnector.setJsonToSharedPreferencechatscreen(StringConstant.chatscreen, "callscreen");
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await Firebase.initializeApp();
  AwesomeNotifications().initialize(null, [NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF800000),
            enableLights: true,
            channelShowBadge: true,
            importance: NotificationImportance.Max,
            ledColor: Colors.white,
        ),
        NotificationChannel(
            channelGroupKey: 'category_tests',
            channelKey: 'call_channel',
            channelName: 'call_channel',
            enableVibration: true,
            channelDescription: 'Channel with call ringtone',
            defaultColor: Color(0xFF800000),
            importance: NotificationImportance.Max,
            ledColor: Colors.white,
            channelShowBadge: true,
            locked: true,
            soundSource: 'resource://raw/telephone'
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_tests',
            channelGroupName: 'Basic tests'),
        NotificationChannelGroup(
            channelGroupkey: 'category_tests',
            channelGroupName: 'Category tests'),
      ],
      debug: true);

  runApp(Sizerapp());
}

class Sizerapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.light().copyWith(
              textTheme: GoogleFonts.assistantTextTheme(Theme.of(context).textTheme)),
          home: MyApp(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver{
  AppTranslationsDelegate _newLocaleDelegate;
  final dbHelper = DatabaseHelper.instance;
  var appstate = true;
  bool background = false;
  var clicked= true;
  ClassLog classlog = ClassLog();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    firebase();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
    AwesomeNotifications().actionStream.listen((receivedAction)  {
      if (receivedAction.channelKey == 'call_channel') {
        switch (receivedAction.buttonKeyPressed) {
          case 'REJECT':
            //EasyLoading.showToast("REJECT", toastPosition: EasyLoadingToastPosition.bottom);
            _callinsert(receivedAction.payload['username'], 'video', 'Missed_Call');
            AndroidForegroundService.stopForeground();
            if(receivedAction.payload['fcmtoken']!=null) {
              fcmapicall('call_cut', receivedAction.payload['fcmtoken'], "", receivedAction.payload['call_id'], "cut");
            }
            break;
          case 'ACCEPT':
            if (receivedAction.payload['calltype'] == 'video') {
              _callinsert(receivedAction.payload['username'], 'video', 'Received_Call');
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  TestLiveStream(Callid: receivedAction.payload['callid'],
                      calleeName: receivedAction.payload['username'])));
                  AndroidForegroundService.stopForeground();
            }
            else if (receivedAction.payload['calltype'] == 'audio'){
              _callinsert(receivedAction.payload['username'],'audio','Received_Call');
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AudioCallpage(
                      Callid: receivedAction.payload['callid'])));
            }
            break;
        }
        return;
      }
      else if (receivedAction.channelKey == 'basic_channel') {
        Navigator.push(context, MaterialPageRoute(builder: (context) => messengertab(rtmpeerid: receivedAction.payload['peerid']/*,name:receivedAction.payload['name']*/)));
        return;
      }
    });
    FlutterCallkitIncoming.onEvent.listen((event) async {
      switch (event.name) {
        case CallEvent.ACTION_CALL_ACCEPT:
          if (event.body['extra']['calltype'] == 'video') {
           await _callinsert(event.body['extra']['username'], 'video', 'Received_Call');
           await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                TestLiveStream(Callid: event.body['extra']['callid'],
                    calleeName: event.body['username'])));
            AndroidForegroundService.stopForeground();
          }
      else if (event.body['extra']['calltype'] == 'audio'){
     await _callinsert(event.body['extra']['username'],'audio','Received_Call');
     await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AudioCallpage(
      Callid: event.body['extra']['callid'])));
      }
          break;
        case CallEvent.ACTION_CALL_DECLINE:
         fcmapicall('call_cut', event.body['extra']['fcmtoken'], "", event.body['extra']['callid'], "cut");
          break;
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print("Hello I m here background");
      background = true;
    }
    if (state == AppLifecycleState.detached) {
      print("Hello I m here in termination");
      WidgetsFlutterBinding.ensureInitialized();
      FirebaseMessaging.onBackgroundMessage(backgroundHandler);
      Firebase.initializeApp();
      background = false;
    }
  }

  void fcmapicall(String msg, String fcmtoken, image, callId, type) {
    Helper.checkConnectivity().then((value) =>
    {
      if (value)
        {
          ApiRepository().fcmnotifiction(msg, '', fcmtoken, image, callId, type, "","").then((value) async {})
        }
      else
        {
          Helper.showNoConnectivityDialog(context)
        }
    });
  }

  Future<void> _callinsert(String calleeName, String calltype, String Calldrm) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.Id: null,
      DatabaseHelper.calleeName: calleeName,
      DatabaseHelper.timestamp: DateTime.now().toString(),
      DatabaseHelper.calltype: calltype,
      DatabaseHelper.Calldrm: Calldrm,
    };
    final id = await dbHelper.callinsert(row);
    print('inserted row id: $id');
    return id;
  }

  void firebase() async {

   // bool canVibrate = await Vibrate.canVibrate;
    // 1. This method only call when App in background it mean app must be closed
    FirebaseMessaging.instance.getInitialMessage().then(
          (message) async{
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message.data['type'] == 'basic_channel') {
          LocalNotificationService.showNotification(message);
          // PreferenceConnector.getJsonToSharedPreferenceechatscreen(StringConstant.chatscreen).then((value) => {
          //   if (value == null){
          //
          //   }
          // });
        } else if (message.data['type'] == 'call_channel') {
          Vibrate.vibrate();
         // LocalNotificationService.showCallNotification(message.data);
          LocalNotificationService.callkitNotification(message);
        //  LocalNotificationService.misscallkitNotification(message);
        } else if (message.data['type'] == 'cut') {
          await FlutterCallkitIncoming.endAllCalls();
          PreferenceConnector.setJsonToSharedPreferencechatscreen(StringConstant.chatscreen, "callscreen");
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) async {
        //SharedPreferences prefs = await SharedPreferences.getInstance();
       // var chatUserName = prefs.getString('chatUserName') ?? "";
       // print("Chat User Name $chatUserName");
        print('listen a forground message ${message.data}');
        var type = message.data['type'];
        if (type == 'basic_channel') {
          LocalNotificationService.showNotification(message);
        }
        else
          if (type == 'call_channel') {
            Vibrate.vibrate();
            LocalNotificationService.callkitNotification(message);
          //  LocalNotificationService.misscallkitNotification(message);
        //  LocalNotificationService.showCallNotification(message.data);
        }
          else
            if (type == 'cut') {
              await FlutterCallkitIncoming.endAllCalls();
          PreferenceConnector.setJsonToSharedPreferencechatscreen(StringConstant.chatscreen, "callscreen");
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) async {
        print('listen a background and not terminated message ${message.data}');
        if (message.data != null) {
          if (message.data['type'] == 'basic_channel') {
            LocalNotificationService.showNotification(message);
          } else if (message.data['type'] == 'call_channel') {
            //Vibrate.vibrate();
           // LocalNotificationService.showCallNotification(message.data);
            LocalNotificationService.callkitNotification(message);
          //  LocalNotificationService.misscallkitNotification(message);
          } else if (message.data['type'] == 'cut') {
            await FlutterCallkitIncoming.endAllCalls();
            PreferenceConnector.setJsonToSharedPreferencechatscreen(StringConstant.chatscreen, "callscreen");
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'bVidya',
      checkerboardOffscreenLayers: true,
      theme: ThemeData(
        // primarySwatch: AppColors.redColor,
        primaryColor: AppColors.redColor,
      ).copyWith(
          textTheme:
          GoogleFonts.assistantTextTheme(Theme
              .of(context)
              .textTheme)),
      //navigatorKey: appConfig<NavigationService>().navigatorKey,
      onGenerateRoute: ScreenRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      localizationsDelegates: [
        _newLocaleDelegate,
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", ""),
        Locale("es", ""),
      ],
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

}
