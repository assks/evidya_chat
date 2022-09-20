import 'package:evidya/constants/string_constant.dart';
import 'package:evidya/model/login/contactsmatch_Modal.dart';
import 'package:evidya/network/repository/api_repository.dart';
import 'package:evidya/resources/app_colors.dart';
import 'package:evidya/screens/messenger/tabview.dart';
import 'package:evidya/sharedpref/preference_connector.dart';
import 'package:evidya/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

import '../../model/rtmtoken_modal.dart';

class Contactsearch_screen extends StatefulWidget {
  final String page;
  final int groupid;
  const Contactsearch_screen({this.page,this.groupid, key}) : super(key: key);

  @override
  _ContactslistscreenState createState() => _ContactslistscreenState();
}

class _ContactslistscreenState extends State<Contactsearch_screen> {
  final ProgressDialog _progressDialog = ProgressDialog();
  List<Contacts> users=[];
  List addGroupUser = [];
  List<Map<String, dynamic>> _foundUsers = [];
  bool loader = false;

@override
  void initState() {
   print(widget.page);
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.length > 2) {
      _searchapi(enteredKeyword);
    }
    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/back_ground.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child:  Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.appNewDarkThemeColor,
            leading: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.keyboard_backspace,color: Colors.white,),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
            centerTitle: true,
            title: const Text("Search Here"),
          ),

          body: Container(
            height: 100.h,
            margin: EdgeInsets.only(top: 1.h,left: 1.h,right: 1.h),
            padding: EdgeInsets.only(top: 2.h,left: 2.h,right: 2.h),
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/grey_background.jpg",),
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: IconButton(
                      //     icon: Icon(Icons.keyboard_backspace,color: Colors.white,),
                      //     onPressed: (){
                      //       Navigator.pop(context);
                      //     },
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        autofocus: false,
                        cursorColor: Colors.black,
                        //controller: _tokenController,
                        decoration:  InputDecoration(
                            isDense: false,
                            border: InputBorder.none,
                            hintText: 'Search Here',
                            contentPadding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
                            hintStyle: TextStyle(color: Colors.black,fontSize: 12.sp),
                            suffixIcon: Icon(Icons.search, color: Colors.black,)
                        ),

                        onChanged: (value) => _runFilter(value),
                      ),
                      const Divider(color: Colors.black,thickness: 1,
                        height: 1,
                        indent: 10,endIndent: 10,),
                      const SizedBox(
                        height: 10,
                      ),
                      friendlist()
                    ],
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }

  void _searchapi(String key) {
    setState(() {
      loader = true;
    });
    PreferenceConnector.getJsonToSharedPreferencetoken(StringConstant.loginData)
        .then((value) => {
      if (value != null)
        {
          ApiRepository().searchusers(key,value)
              .then((value) {
            _progressDialog.dismissProgressDialog(context);
            if (value != null) {
              if (value.status == "successfull") {
                setState(() {
                  users = value.body.contacts;
                  print("User List $users");
                  loader = false;
                });
              } else {
                Helper.showMessage("No Result found");
              }
            }
          })
        }
    });
  }

  friendlist() {
    return loader == false?
    users.length != 0
        ? Container(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, position) {

          return InkWell(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.appNewDarkThemeColor,
                      child: Center(
                          child: Text(
                              "${users[position].name[0]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,
                                  fontSize: 15.sp)
                          )),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${users[position].name}',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                        Text("Tap to Add",
                          style: TextStyle(color: Colors.grey,
                            fontSize: 10.sp,
                          ),),
                      ],
                    )
                  ],
                ),
              ),
              onTap: () async {
                if(widget.page!="InGroup"){
                  peerIdApi(users[position].id,users[position],users[position].name);
                }else{
                  addGroupUser.add("#"+users[position].id.toString() +"#");
                  var  data = addGroupUser.join(",");
                 addGroupMember(data);
                }

              }
          );
        },
        itemCount: users.length,
      ),
    )
        :  Center(child: Text("No User Found!",style: TextStyle(
        color: Colors.grey,
        fontSize: 20.sp
    ),),)
        :Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 1.5,),
            ),

            Text("   Loading...", style: TextStyle(color: Colors.white, fontSize: 13.sp),)
          ],

        )
    );
  }


  void peerIdApi(var id, Contacts userdata, String addUserName) {
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
                    toastPosition: EasyLoadingToastPosition.top,
                    duration: Duration(seconds: 3)
                );
              } else {
                EasyLoading.showToast("${addUserName} already Added in chat list.",
                    toastPosition: EasyLoadingToastPosition.top,
                    duration: Duration(seconds: 3)
                );
              }
            }
          })
        }
    });
  }


  void addGroupMember(var addMember) {
    Helper.checkConnectivity().then((value) => {
      if (value)
        {
          PreferenceConnector.getJsonToSharedPreference(
              StringConstant.loginData)
              .then((value) => {
            if (value != null)
              {
                ApiRepository().addGroupMembers(token: value, groupId: widget.groupid.toString(), members: addMember,
                )
                    .then((value) {
                  if (value['status'] == "successfull") {
                    EasyLoading.dismiss();
                    print("Success $value");
                    setState(() {
                      EasyLoading.showToast("New Member Added",
                          toastPosition:
                          EasyLoadingToastPosition.bottom,
                          duration: Duration(seconds: 2));
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              messengertab(),
                        ),
                            (route) => false,
                      );
                    });
                  } else {
                    EasyLoading.dismiss();
                    EasyLoading.showToast(
                        "Error! Something went wrong.");
                  }
                })
              }
            else
              {
                EasyLoading.dismiss(),
                EasyLoading.showToast(
                    "Something went wrong please logout and login again.")
              }
          })
        }
      else
        {Helper.showNoConnectivityDialog(context)}
    });
  }
}
