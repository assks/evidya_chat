import 'package:agora_rtm/agora_rtm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:evidya/constants/string_constant.dart';
import 'package:evidya/model/login/contactsmatch_Modal.dart';
import 'package:evidya/model/recentchatconnectionslist_modal.dart';
import 'package:evidya/network/repository/api_repository.dart';
import 'package:evidya/resources/app_colors.dart';
import 'package:evidya/screens/messenger/group/group_chat_screen.dart';
import 'package:evidya/screens/messenger/logs.dart';
import 'package:evidya/sharedpref/preference_connector.dart';
import 'package:evidya/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';
import '../../../localdb/databasehelper.dart';
import '../tabview.dart';
import 'create_group.dart';

class GroupListPage extends StatefulWidget {

  final AgoraRtmClient client;
  final AgoraRtmChannel channel;
  final String rtmpeerid;
  final LogController logController;
  final MessageLog messagePeerId;
  final Contacts userdetails;
  final Connections recentchatuserdetails;
  final GroupMessageLog groupmessagelog;

  const GroupListPage(
      {this.client,
      this.channel,
      this.logController,
      this.userdetails,
      this.messagePeerId,
      this.rtmpeerid,
      this.groupmessagelog,
      this.recentchatuserdetails,
      Key key})
      : super(key: key);

  @override
  State<GroupListPage> createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage> {
  bool loader = false;
  List groupListData = [];
  List groupMembers = [];
  List<Connections> filterdUsers = [];
  List<Connections> apiusers = [];
  List<Connections> users = [];
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    groups();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/back_ground.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.appNewDarkThemeColor,
            centerTitle: true,
            leading: IconButton(
              icon:  Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
                size: 3.h,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(
                        builder: (context) => messengertab()),
                    (Route<dynamic> route) => false);
              },
            ),
            title: Text("Group List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 2.5.h)),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateGroup()));
                  },
                  icon:  Icon(
                    Icons.add,
                    size: 3.h,
                  ))
            ],
          ),
          body: Container(
            margin:
                EdgeInsets.only(top: 1.h, right: 1.h, left: 1.h, bottom: 1.h),
            padding: EdgeInsets.only(left: 1.h, right: 1.h, top: 1.h),
            height: 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/grey_background.jpg",
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
            child: loader == false
                ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Fetching Data...",
                          style: TextStyle(
                              fontSize: 2.1.h,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                : groupListData.length == 0
                 ? Center(
                    child: Text(
                     "No Recent Group List!",
                     style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
          ),
        )
                 :ValueListenableBuilder(
                    valueListenable: widget.groupmessagelog,
                    builder: (context, log, wdgt) {
                      return ListView.separated(
                          itemBuilder: (BuildContext context, int i) {
                            print(StringConstant.BASE_URL +
                                groupListData[i].image);
                              return InkWell(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: CircleAvatar(
                                                radius: 3.2.h,
                                                backgroundColor: AppColors
                                                    .appNewDarkThemeColor,
                                                child: Center(
                                                    child: groupListData[i]
                                                                .image !=
                                                            null
                                                        ? CachedNetworkImage(
                                                            imageUrl: StringConstant
                                                                    .IMAGE_URL +
                                                                groupListData[i]
                                                                    .image,
                                                            imageBuilder: (context,
                                                                    imageProvider) =>
                                                                Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                image: DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    /*colorFilter: const ColorFilter
                                                                            .mode(
                                                                        Colors
                                                                            .red,
                                                                        BlendMode
                                                                            .colorBurn)*/),
                                                              ),
                                                            ),
                                                            height: 30.h,
                                                            width: 40.w,
                                                            placeholder: (context,
                                                                    url) =>
                                                                const CircularProgressIndicator(),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    const Icon(
                                                              Icons.error,
                                                              size: 50,
                                                            ),
                                                          )
                                                        : Text(
                                                            "${groupListData[i].groupName[0]}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    2.5.h))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              groupListData[i].groupName,
                                              style: TextStyle(
                                                  fontSize: 2.1.h,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${groupListData[i].description}",
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 2.0.h,
                                              ),
                                            ),
                                          ],
                                        )),
                                        badge(log, groupListData[i].groupName)
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    deletelog(groupListData[i].groupName, log);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GroupChatScreen(
                                                  client: widget.client,
                                                  rtmpeerid: groupListData[i].members[0].pid,
                                                  membersList: groupListData[i].members,
                                                  messagePeerId: widget.messagePeerId,
                                                  logController: widget.logController,
                                                  recentchatuserdetails: groupListData[i],
                                                  groupmessagelog: widget.groupmessagelog,
                                                  self: groupListData[i].self,

                                                )));
                                  });
                          },
                          separatorBuilder: (_, __) => const Divider(
                                indent: 10,
                                endIndent: 10,
                                height: 1,
                                thickness: 1,
                                color: Colors.grey,
                              ),
                          itemCount: groupListData.length);
                    }),

            ///sd
          ),
        ),
      ),
    );
  }

  void groups() {
    loader = false;
    Helper.checkConnectivity().then((value) => {
          if (value)
            {
              PreferenceConnector.getJsonToSharedPreference(
                      StringConstant.loginData)
                  .then((value) => {
                        if (value != null)
                          {
                            ApiRepository().groupList(value).then((value) {
                              if (value != null) {
                                setState(() {
                                  groupListData = value.body.groups;
                                  loader = true;
                                  print("hello $groupListData");
                                });
                                for (int a = 0; a < groupListData.length; a++) {
                                  setState(() {
                                    apiusers = groupListData;
                                    _insert(groupListData[a]);
                                  });
                                }
                              } else {
                                EasyLoading.showToast("Some went wrong!",
                                    toastPosition:
                                        EasyLoadingToastPosition.bottom);
                              }
                            })
                          }
                        else
                          {
                            EasyLoading.showToast("Some went wrong!",
                                toastPosition: EasyLoadingToastPosition.bottom),
                          }
                      })
            }
          else
            {Helper.showNoConnectivityDialog(context)}
        });
  }

  _insert(Connections users) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.Id: null,
      DatabaseHelper.name: users.name,
      DatabaseHelper.timestamp: DateTime.now().toString(),
      DatabaseHelper.userid: users.id,
      DatabaseHelper.status: users.fcm_token ?? "0",
      DatabaseHelper.peerid: users.peerId,
      DatabaseHelper.badge: ''
    };
    final fcmcount =
        await dbHelper.updatedgroupfcm(users.peerId, users.fcm_token);
    if (fcmcount == 0) {
      final id = await dbHelper.updategroupfcm(users.peerId, users.fcm_token);
      print('inserted row id1: $id');
      // _query();
    }
    final count = await dbHelper.getgroupcount(users.peerId);
    if (count == 0) {
      final id = await dbHelper.recentchatgrouplist(row);
      print('inserted row id1: $id');
      // _query();
    }
    print('inserted row id2: $count');
    return count;
  }

  badge(log, currentgroup) {
    var badgeno = 0;
    for (int a = 0; a < log.length; a++) {
      if (currentgroup == log[a]) {
        badgeno++;
      }
    }
    if (badgeno == 0) {
      return Container();
    }
    return badgeicon(badgeno);
  }

  Widget badgeicon(no) {
    return CircleAvatar(
        backgroundColor: Colors.red,
        radius: 10,
        child: Text(no.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 8.sp, color: Colors.white)));
  }

  void deletelog(groupname, log) {
    widget.groupmessagelog.removegroupLog(groupname);

  }
}
