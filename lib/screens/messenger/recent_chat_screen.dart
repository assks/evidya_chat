import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:agora_rtm/agora_rtm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:evidya/constants/string_constant.dart';
import 'package:evidya/localdb/databasehelper.dart';
import 'package:evidya/model/login/PrefranceData.dart';
import 'package:evidya/model/recentchatconnectionslist_modal.dart';
import 'package:evidya/network/repository/api_repository.dart';
import 'package:evidya/resources/app_colors.dart';
import 'package:evidya/screens/messenger/call_history_screen.dart';
import 'package:evidya/screens/messenger/contactlist.dart';
import 'package:evidya/screens/messenger/contactsearch_screen.dart';
import 'package:evidya/screens/messenger/group/group_list_page.dart';
import 'package:evidya/screens/messenger/logs.dart';
import 'package:evidya/sharedpref/preference_connector.dart';
import 'package:evidya/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'chat_screen.dart';
import 'dart:math' as math;


class RecentChat extends StatefulWidget {
  final LogController logController;
  final AgoraRtmClient client;
  final String userpeerid;
  final String clientpeerid;
  final MessageLog messageLog;
  final GroupMessageLog groupmessageLog;

  const RecentChat(
      {Key key,
        this.logController,
        this.client,
        this.userpeerid,
        this.groupmessageLog,
        this.clientpeerid,
        this.messageLog})
      : super(key: key);

  @override
  _RecentChatState createState() => _RecentChatState();
}

class _RecentChatState extends State<RecentChat> {
  List<Connections> users = [];
  List<Connections> apiusers = [];
  List<Connections> filterdUsers = [];
  List<Connections> filterdnonUsers = [];
  final dbHelper = DatabaseHelper.instance;
  MessageLog messagelog = MessageLog();
  Timer timer;
  var no = 1,day;
  bool loader = false;
  bool control = false;
  String fullname;
  var _image;
  String image,token;

  @override
  void initState() {
    super.initState();
    SharedPreferencedata();
    _query();
    _fetchrecentchatlist();
  }

  void SharedPreferencedata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    image = prefs.getString('profileImage');
    await PreferenceConnector.getJsonToSharedPreferencetoken(StringConstant.Userdata)
        .then((value) => {
      if (value != null)
        {
          userdata = jsonDecode(value.toString()),
          setState(() {
            localdata = PrefranceData.fromJson(userdata);
            fullname = localdata.name;

          })
        }
    });
  }
  void _query() async {
    final _allRows = await dbHelper.getAlldata();
    filterdUsers.clear();
    users.clear();
    var index=0;
    for(var value in _allRows){
   // _allRows.forin((value) {

      setState(() {
        filterdUsers.add(value);
        users.add((value));
      });
      if(widget.clientpeerid!=null) {
        if (value.peerId == widget.clientpeerid) {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              Chat_Screen(
                client: widget.client,
                rtmpeerid: widget.clientpeerid,
                messagePeerId: widget.messageLog,
                logController: widget.logController,
                recentchatuserdetails: filterdUsers[index],
                userlist: filterdUsers,
              )));
         break;
        }
      }
      index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
          preferredSize:  Size.fromHeight(10.h),
          // here the desired height
          child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 5, right: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.transparent, width: 1),
                              color:
                              Colors.transparent
                          ),
                          child: _image != null
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              _image,
                              height: 7.h,
                              width: 15.w,
                              fit: BoxFit.fill,
                            ),
                          )
                              : image != null
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              width: 15.w,
                              height:7.h,
                              imageUrl: StringConstant.IMAGE_URL + image,
                              placeholder: (context, url) =>
                                  Helper.onScreenProgress(),
                              errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                            ),
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/teacher.PNG',
                              height: 7.h,
                              width: 15.w,
                              fit: BoxFit.fill,
                            ),
                          )
                      ),
                      SizedBox(width: 1.h,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("$fullname",
                              style: TextStyle(fontSize: 2.6.h,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                            Text("online", style: TextStyle(
                                fontSize: 2.1.h, color: Colors.white),)
                          ],
                        ),
                      ),
                      InkWell(
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.addedColor,
                                    AppColors.addedColor,
                                  ],
                                )
                            ),
                            child: Icon(Icons.search,
                              color: AppColors.appNewLightThemeColor,
                              size: 3.h,)
                        ),
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>
                                  Contactsearch_screen())).whenComplete(initState);
                        },
                      ),
                    ],
                  )
              )),
      body: Container(
          margin: EdgeInsets.only(left: 1.h,right: 1.h),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              //bottomLeft: Radius.circular(10),
              //bottomRight: Radius.circular(18),
            ),
            image: DecorationImage(
                image: AssetImage("assets/images/whitebg.png"),
                fit: BoxFit.cover
            ),
          ),
          child:Column(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 2.h,right: 2.h,top: 1.h),
                  //height: 18.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:const EdgeInsets.only(top: 5,left: 10),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'b',
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 3.h),
                                    children: <TextSpan>[
                                      TextSpan(text: 'chat',
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 3.h),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              AppColors.addedColor,
                                              AppColors.addedColor,
                                            ],
                                          )
                                      ),
                                      child: Image.asset("assets/icons/svg/call.png",
                                        height: 2.h,width: 2.h,
                                        color: Colors.white,),
                                    ),
                                    SizedBox(height: 3,),
                                    Text("Recent Calls",style: TextStyle(fontSize: 1.6.h,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>
                                          CallHistoryScreen()));
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: .5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:EdgeInsets.only(top: 0,left: 5),
                          child:Row(
                            children: [
                              InkWell(
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(width: 1,color: Colors.red)
                                    ),
                                    child: Icon(Icons.add,size: 3.h,)
                                ),
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>
                                          ContactList(logController: widget.logController, client: widget.client)));
                                },
                              ),
                              SizedBox(width: 3.w,),
                              Text("New Messages", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 2.5.h),),
                            ],
                          ),
                          ),
                          InkWell(
                            child: Row(
                              children: [
                                Text("Groups",style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 2.h),),
                                SizedBox(width: 5,),
                                Icon(Icons.people_alt_sharp,
                                  size: 3.h,
                                  color: Colors.black,)
                              ],
                            ),
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) =>
                                      GroupListPage(
                                        client: widget.client,
                                        messagePeerId: widget.messageLog,
                                        logController: widget.logController,
                                        groupmessagelog: widget.groupmessageLog,
                                      )
                                  )
                              ).whenComplete(initState);
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 1.h,)
                    ],
                  )
              ),
              const Divider(thickness: .5,height: 1, color: Colors.black26,indent: 15,endIndent: 15,),
              Expanded(child: Container(
                  height: MediaQuery.of(context).size.height,

                  padding: EdgeInsets.only(left: 2.h,top: 0.h,right: 2.h,),
                  //height: 18.h,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.transparent
                  ),
                  child: Column(
                    children: [
                      ValueListenableBuilder(
                          valueListenable: widget.messageLog,
                          builder: (context, log, widget) {
                            short(log,users);
                            return recentchatlist(log);
                          }
                      ),
                    ],
                  )
              ))
            ],
          )

      ),
    );
  }

  Widget recentchatlist(dynamic log,) {
    print("Hello ${log.length}");
    if (loader == false) {
      return Expanded(
          child: Center(
            child: Text("Loading",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 3.h
              ),),
          )
      );
    } else {
      if (filterdUsers.length == 0) {
        return Expanded(
            child: Center(
              child: Text("No Recent Chat History!", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 3.h
              ),),
            )
        );
      } else {
        return Expanded(child: ListView.separated(
            itemCount: filterdUsers.length,
            separatorBuilder: (_, __) =>
            const Divider(thickness: .5,height: 1,color: Colors.black26),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              if (loader == true) {
                day = DateTime
                    .now()
                    .difference(
                    DateTime(DateTime.parse(filterdUsers[i].timeStamp == null ? "2022-07-25 17:36:30.956695" : filterdUsers[i].timeStamp).year,
                        DateTime.parse(filterdUsers[i].timeStamp == null ? "2022-07-25 17:36:30.956695" : filterdUsers[i].timeStamp).month,
                        DateTime.parse(filterdUsers[i].timeStamp == null ? "2022-07-25 17:36:30.956695" : filterdUsers[i].timeStamp).day))
                    .inDays;
              }
              return Padding(
                padding: EdgeInsets.only(top: 1.h,bottom: 1.h),
                child: InkWell(
                    onTap: () {
                      no = 0;
                      dbHelper.deletebadge(filterdUsers[i].peerId);
                      if (control) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                               Chat_Screen(
                                  client: widget.client,
                                  rtmpeerid: filterdUsers[i].peerId,
                                  messagePeerId: widget.messageLog,
                                  logController: widget.logController,
                                  recentchatuserdetails: filterdUsers[i],
                                  userlist:filterdUsers,
                                )));
                      } else {
                        widget.logController.clear();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                Chat_Screen(
                                  client: widget.client,
                                  rtmpeerid: filterdUsers[i].peerId,
                                  messagePeerId: widget.messageLog,
                                  logController: widget.logController,
                                  recentchatuserdetails: filterdUsers[i],
                                  userlist:filterdUsers,
                                )));
                      }
                      control = true;
                    },
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 3.h,
                            backgroundColor: Colors.white54,
                            child: Center(
                              child: filterdUsers[i].profile_image==""? Text(
                                filterdUsers[i].name[0],
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 3.h
                                ),
                              ):ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: 25.w,
                                  height: 9.7.h,
                                  imageUrl: StringConstant.IMAGE_URL +
                                      filterdUsers[i].profile_image,
                                  placeholder: (context, url) =>
                                      Helper.onScreenProgress(),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.person,color: Colors.white,),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: 2.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(filterdUsers[i].name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 2.2.h,
                                              fontWeight: FontWeight.bold)),
                                      // Text('Last Message',
                                      //     style: TextStyle(
                                      //         color: Colors.grey,
                                      //         fontSize: 2.h))
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        loader == true ? Text(
                                            day == 0
                                                ? DateFormat('hh:mm a').format(
                                                DateTime.parse(
                                                    filterdUsers[i].timeStamp ??
                                                        ""))
                                                : day == 1
                                                ? 'Yesterday'
                                                : DateFormat('yy/MM/dd').format(
                                                DateTime.parse(filterdUsers[i].timeStamp == null
                                                    ? "2022-07-25 17:36:30.956695"
                                                    : filterdUsers[i].timeStamp.toString())).toString(),
                                            style: TextStyle(fontSize: 1.6.h,
                                                color: (filterdUsers[i].badge !=
                                                    null &&
                                                    filterdUsers[i].badge !=
                                                        "0" &&
                                                    filterdUsers[i].badge != "")
                                                    ? AppColors.addedColor
                                                    : Colors.grey
                                            ))
                                            : Text(""),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    (filterdUsers[i].badge != null &&
                                        filterdUsers[i].badge != "0" &&
                                        filterdUsers[i].badge != "")
                                        ? CircleAvatar(
                                        backgroundColor: AppColors.addedColor,
                                        radius: 1.3.h,
                                        child: Text(
                                            "${filterdUsers[i].badge}", textAlign:
                                        TextAlign.center,
                                            style: TextStyle(fontSize: 1.6.h,
                                                color: Colors.white)))
                                        : Container(),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
              );
            }));
      }
    }
  }

  void _fetchrecentchatlist() {
    setState(() {
      loader = false;
    });
    PreferenceConnector.getJsonToSharedPreferencetoken(StringConstant.loginData)
        .then((value) => {
      if (value != null)
        {
          ApiRepository().recentconnection(value).then((value) {
            if (mounted) {
              if (value != null) {
                if (value.status == "successfull") {
                  setState(() {
                    dynamic  users = value.body.connections;
                    var index;
                    for (int a = 0; a < users.length; a++) {
                      setState(() {
                        apiusers = users;
                        _insert(users[a]);
                        if(widget.clientpeerid!=null) {
                          if (users[a].peerId == widget.clientpeerid) {
                            index = a;
                          }
                        }
                      });
                    }
                    if(filterdUsers.isEmpty){
                      print("Hello Dear ${filterdUsers.length}");
                      filterdUsers = users;
                      if(widget.clientpeerid!=null) {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                Chat_Screen(
                                  client: widget.client,
                                  rtmpeerid: widget.clientpeerid,
                                  messagePeerId: widget.messageLog,
                                  logController: widget.logController,
                                  recentchatuserdetails: filterdUsers[index],
                                  userlist: filterdUsers,
                                )));
                      }
                      print("Hello Dear2 ${filterdUsers.length}");
                    }
                  });
                  setState(() {
                    loader = true;
                  });
                } else {
                  Helper.showMessage("No Result found");
                }
              }
            }
          })
        }
    });
  }

  _insert(Connections users) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.Id: null,
      DatabaseHelper.name: users.name,
      DatabaseHelper.timestamp: DateTime.now().toString(),
      DatabaseHelper.userid: users.id,
      DatabaseHelper.status: users.fcm_token??"0",
      DatabaseHelper.peerid: users.peerId,
      DatabaseHelper.badge: '',
      DatabaseHelper.profile_image: users.profile_image,
      DatabaseHelper.email: users.email,
      DatabaseHelper.phone: users.phone,
    };
    final fcmcount = await dbHelper.updatedfcm(users.peerId,users.fcm_token);
    if(fcmcount==0){
      final id = await dbHelper.updatefcm(users.peerId,users.fcm_token);
      print('inserted row id1: $id');
      _query();
    }
    final count = await dbHelper.getcount(users.peerId);
    if (count == 0) {
      final id = await dbHelper.recentchatlist(row);
      print('inserted row id1: $id');
      _query();
    }
    print('inserted row id2: $count');
    return count;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  Widget getWidget(dynamic log, badge, peerid) {
    CircleAvatar(
        backgroundColor: Colors.red,
        radius: 8,
        child: Text(badge, style: const TextStyle(fontSize: 10, color: Colors.white)));
  }

  void deletelog(peerid) {
    widget.messageLog.removeLog(int.parse(peerid));
  }
  var a =0;
  void short(dynamic log, dynamic user) async {

    if(a<log.length){
      updatelocaldata(log.last);
      print("updatebadge");
      _query();
      a++;
    }
  }

  void updatelocaldata(user) async {
    dynamic peer_time = user.split('#@#&');
    await dbHelper.update(peer_time[0],peer_time[1] ?? DateTime.now());
    print('query all rows:');
    // allRows.forEach(print);
  }

}
