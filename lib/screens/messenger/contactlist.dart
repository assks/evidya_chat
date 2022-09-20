import 'package:agora_rtm/agora_rtm.dart';
import 'package:evidya/constants/string_constant.dart';
import 'package:evidya/model/login/contactsmatch_Modal.dart';
import 'package:evidya/network/repository/api_repository.dart';
import 'package:evidya/resources/app_colors.dart';
import 'package:evidya/screens/messenger/group/create_group.dart';
import 'package:evidya/screens/messenger/logs.dart';
import 'package:evidya/screens/messenger/tabview.dart';
import 'package:evidya/sharedpref/preference_connector.dart';
import 'package:evidya/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class ContactList extends StatefulWidget {
  final LogController logController;
  final AgoraRtmClient client;
  const ContactList({Key key, this.logController,this.client}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> _contacts;
  bool _permissionDenied = false;
  List<String> names = [];
  List<String> amar = [];
  bool loader = false;
  List<Contact> nonuser = [];
  final String appId = "d6306b59624c4e458883be16f5e6cbd2";
  final String channalid = "prashant";
  final String userid = "123";

  final ProgressDialog _progressDialog = ProgressDialog();
  List<Contacts> users = [];

  @override
  void initState() {
    _fetchContacts();
    super.initState();
  }
  /// Getting Contact List from Phone Contacts.
  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      setState(() {
        loader = false;
      });
      // EasyLoading.show();
      final contacts = await FlutterContacts.getContacts(withProperties: true, withPhoto: true);
      setState(() => _contacts = contacts);
      // EasyLoading.dismiss();

    }
    for (Contact name in _contacts) {
      if(name.phones.length!=0){
        var phone_no= name.phones.first.number.replaceAll(' ', '').characters.takeLast(10).toString();
        if(phone_no.length>=10){
          await names.add(phone_no);
        }}}

    conatactlist(names);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/back_ground.jpg"),
              fit: BoxFit.fill
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: AppColors.appNewDarkThemeColor,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.keyboard_backspace,color: Colors.white,),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "People",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
            ),
            body: Container(
              height: 100.h,
              margin: EdgeInsets.only(left: 1.h,right: 1.h,top: 1.h),
              padding: EdgeInsets.only(left: 5,right: 5,top: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/grey_background.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                ),
              ),
              child: CustomScrollView(
                slivers: <Widget>[
                  // SliverToBoxAdapter(
                  //     child: InkWell(
                  //       child: Card(
                  //         color: AppColors.appNewLightThemeColor,
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(5)
                  //         ),
                  //         child: Center(
                  //           child: Padding(
                  //             padding: EdgeInsets.symmetric(horizontal: 1.h,vertical: 1.h),
                  //             child: Text("Create Group",
                  //               style: TextStyle(color: Colors.white,fontSize: 13.sp),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       onTap: (){
                  //         Navigator.push(context,MaterialPageRoute(builder: (context)=>const CreateGroup()));
                  //       },
                  //     )
                  // ),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(child: Divider(height: 2,thickness: 1,indent:10,endIndent:10,
                          color: AppColors.appNewDarkThemeColor,)),
                        Text("Contacts",
                          style: TextStyle(color: AppColors.appNewDarkThemeColor,fontSize: 13.sp,
                              fontWeight: FontWeight.bold),),
                        Expanded(child: Divider(height: 2,thickness: 1,indent:10,endIndent:10,
                          color: AppColors.appNewDarkThemeColor,))
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: loader == false?
                    SliverChildBuilderDelegate(
                            (BuildContext context, int i) {
                          return Container(
                            height: 80.h,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 30,width: 30,
                                    child: CircularProgressIndicator(strokeWidth: 2,),),
                                  SizedBox(width:10),
                                  Text("Fetching Data...",style: TextStyle(fontSize: 12.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: 1
                    )
                        :SliverChildBuilderDelegate(
                            (BuildContext context, int i) {
                          print("UserLength ${users.length}");
                          if(users.length == "0"){
                            return  Center(
                              child: Text("No Recent Contact!",style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.sp
                              ),
                              ),
                            );
                          }
                          else{
                            return InkWell(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: AppColors.appNewDarkThemeColor,
                                        child: Center(
                                            child: Text(
                                                "${users[i].name[0]}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.white,
                                                    fontSize: 15.sp)
                                            )),
                                      ),
                                      // Container(
                                      //   decoration:  BoxDecoration(
                                      //       color: AppColors.cardContainerColor,
                                      //       borderRadius: BorderRadius.all(Radius.circular(5))),
                                      //   height: 6.h,
                                      //   width: 12.w,
                                      //   child: Center(
                                      //     child: Text(
                                      //       '${users[i].name[0]}',
                                      //       textAlign: TextAlign.center,
                                      //       style: TextStyle(color: Colors.white,
                                      //           fontSize: 15.sp,
                                      //           fontWeight: FontWeight.w500
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(width: 15,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(users[i].name,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          Text("Tap to Add",
                                            style: TextStyle(color: Colors.grey,
                                              fontSize: 10.sp,),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () async {
                                  peerIdApi(users[i].id,users[i],users[i].name);
                                }
                            );
                          }
                        },
                        childCount: users.length
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(child: Divider(height: 2,thickness: 1,indent:10,endIndent:10,
                          color: AppColors.appNewDarkThemeColor,)),
                        Text("Invite Contacts", style: TextStyle(color: AppColors.appNewDarkThemeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp),),
                        Expanded(child: Divider(height: 2,thickness: 1,indent:10,endIndent:10,
                          color: AppColors.appNewDarkThemeColor,))
                      ],
                    ),
                  ),
                  SliverList(
                    delegate:SliverChildBuilderDelegate(
                            (BuildContext context, int i) {
                          return InkWell(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: AppColors.appNewLightThemeColor,
                                      child: Center(
                                          child: Text(
                                              "${nonuser[i].displayName[0]}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white,
                                                  fontSize: 15.sp)
                                          )),
                                    ),
                                    // Container(
                                    //   decoration:  BoxDecoration(
                                    //       color: AppColors.cardContainerColor,
                                    //       borderRadius: BorderRadius.all(Radius.circular(5))),
                                    //   height: 6.h,
                                    //   width: 12.w,
                                    //   child: Center(
                                    //     child: Text(
                                    //       '${nonuser[i].displayName[0]}',
                                    //       textAlign: TextAlign.center,
                                    //       style: TextStyle(color: Colors.white,
                                    //           fontSize: 15.sp,
                                    //           fontWeight: FontWeight.w500
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${nonuser[i].displayName}',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          ),),
                                        Text("Invite",
                                          style: TextStyle(color: Colors.grey,
                                            fontSize: 10.sp,
                                          ),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              onTap: () async {
                                final fullContact = await FlutterContacts.getContact(nonuser[i].id);
                              }
                          );
                        },
                        childCount: nonuser.length
                    ),
                  ),
                ],
              ),
            )
          // physics: ClampingScrollPhysics(),
        )
    );
  }

  void conatactlist(List numbers) {
    //EasyLoading.show();
    PreferenceConnector.getJsonToSharedPreferencetoken(StringConstant.loginData)
        .then((value) => {
      if (value != null)
        {
          ApiRepository().searchcontact(numbers, value).then((value) {
            //_progressDialog.dismissProgressDialog(context);
            // EasyLoading.dismiss();
            setState(() {
              loader = true;
            });
            if(mounted) {
              if (value != null) {
                if (value.status == "successfull") {
                  setState(() {
                    users = value.body.contacts;
                    filterContacts();
                    Helper.showMessage(value.status.toString());
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

  void filterContacts() async {
    List<String> unique = [];
    for (Contacts name in users) {
      await amar.add(name.phone);
      for (var value in names) {
        var a = value.replaceAll(' ', '');
        if (!amar.contains(a)) {
          await unique.add(value);
        }
      }
    }
    for (Contact name in _contacts) {
      var a = name.phones.isEmpty?0:name.phones.first.number.replaceAll(' ', '');
      if (!amar.contains(a)) {
        await nonuser.add(name);
      }
    }
  }

  /// Save the contact in recent chat
  void peerIdApi(var id, Contacts userdata,String addUserName) {

    PreferenceConnector.getJsonToSharedPreferencetoken(StringConstant.loginData)
        .then((value) => {
      if (value != null)
        {
          ApiRepository().addfriend(userdata.id.toString(), value).then((value) {
            if (value != null) {
              if (value.status == "successfull") {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => messengertab()),
                        (Route<dynamic> route) => false);
                EasyLoading.showToast("${addUserName} Added in chat list.",
                    toastPosition: EasyLoadingToastPosition.bottom,
                    duration: Duration(seconds: 3)
                );
              } else {
                EasyLoading.showToast("${addUserName} already Added in chat list.",
                    toastPosition: EasyLoadingToastPosition.bottom,
                    duration: Duration(seconds: 3)
                );
              }
            }
          })
        }
    });
  }
}


