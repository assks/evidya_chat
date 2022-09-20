import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:evidya/constants/string_constant.dart';
import 'package:evidya/model/login/contactsmatch_Modal.dart';
import 'package:evidya/network/repository/api_repository.dart';
import 'package:evidya/resources/app_colors.dart';
import 'package:evidya/screens/messenger/group/add_group_info.dart';
import 'package:evidya/screens/messenger/group/group_list_page.dart';
import 'package:evidya/sharedpref/preference_connector.dart';
import 'package:evidya/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

import '../../../model/groupcontact.dart';
import '../contactsearch_screen.dart';
import '../tabview.dart';
class CreateGroup extends StatefulWidget {
  final String page;
  final int groupId;
  const CreateGroup({this.page,this.groupId,Key key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<Contact> _contacts;
  bool _permissionDenied = false;
  List<String> names = [];
  List<String> amar = [];
  List addGroupUser = [];
  var userSelected = [];
  bool loader = false;
  List<Contact> nonuser = [];
  final String appId = "d6306b59624c4e458883be16f5e6cbd2";
  final String channalid = "prashant";
  final String userid = "123";

  List<Users> users = [];

  @override
  void initState() {
    _fetchContacts();
    addGroupUser.clear();
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
  void conatactlist (List numbers) {
    //EasyLoading.show();
    PreferenceConnector.getJsonToSharedPreferencetoken(StringConstant.loginData)
        .then((value) => {
      if (value != null)
        {
          ApiRepository().groupcontact( value).then((value) {
            setState(() {
              loader = true;
            });
            if(mounted) {
              if (value != null) {
                if (value.status == "successfull") {
                  setState(() {
                    users = value.body.users;
                    for(int i = 0; i< users.length; i++){
                      userSelected.add(false);
                    }
                    filterContacts();
                  });
                } else {
                }
              }
            }
          })
        }
    });
  }

  void filterContacts() async {
    List<String> unique = [];
    for (Users name in users) {
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
              icon: Icon(Icons.keyboard_backspace,color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            title: widget.page!="InGroup"? Column(
              children: [
                Text(
                  "New Group",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
                Text(
                  "Add Participants",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.sp),
                ),
              ],
            ): Text(
              "Add new members",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
             actions: [ widget.page!=null?
              IconButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Contactsearch_screen(page: widget.page,groupid:widget.groupId)));
              },
                  icon: Icon(Icons.search)):Container()
            ],
          ),
          body: Container(
            margin: EdgeInsets.only(top: 1.h,right: 1.h,left: 1.h,bottom: 1.h),
            padding: EdgeInsets.only(left: 1.h,right: 1.h,top: 1.h),
            height: 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/grey_background.jpg",),
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: loader == false
                ? Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,width: 30,
                    child: CircularProgressIndicator(strokeWidth: 2,),),
                  SizedBox(width:10),
                  Text("Fetching Data...",style: TextStyle(fontSize: 12.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),)
                ],
              ),
            )
                : ListView.separated(itemBuilder: (BuildContext context, int i){

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
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                              radius: 25,
                               backgroundColor: AppColors.cardContainerColor,
                                child: Center(
                                    child:users[i].profile_image!=""? Text(
                                        "${users[i].name[0]}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white,
                                            fontSize: 15.sp)
                                    ): ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          width: 21.w,
                                          height:10.h,
                                          imageUrl: StringConstant.IMAGE_URL + users[i].profile_image,
                                          placeholder: (context, url) =>
                                              Helper.onScreenProgress(),
                                          errorWidget: (context, url, error) =>
                                          new Icon(Icons.error),
                                        )) ),
                              ),
                              Positioned(
                                bottom: 0,
                                  right: 0,
                                  child: userSelected[i] == true
                                      ? CircleAvatar(
                                            radius: 10,
                                            backgroundColor:AppColors.appNewLightThemeColor,
                                          child: Icon(Icons.check,size: 12,color: Colors.white,),)
                                      :Container()
                              )
                            ],
                          ),
                          const SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(users[i].name,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),),
                              Text(users[i].email,
                                style: TextStyle(color: Colors.grey,
                                  fontSize: 10.sp,),),
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: () async {
                      if (userSelected[i] ==
                          false) {
                     if(addGroupUser.length < 11) {
                       setState(() {
                         userSelected[i] = true;
                         addGroupUser.add("#"+users[i].id.toString() +"#");
                       });
                     } else{
                       EasyLoading.showToast("Group members exceed the limit",
                           toastPosition: EasyLoadingToastPosition.bottom,
                       duration: Duration(seconds: 2));
                     }
                      } else {
                        setState(() {
                            userSelected[i] = false;
                            addGroupUser.remove(
                                "#"+users[i].id.toString() +"#");
                        });
                      }
                    }
                );
              }
            },
                separatorBuilder: (_,__)=>const Divider(
                  indent: 10,endIndent: 10,
                  height: 1,thickness: 1,color: Colors.grey,),
                itemCount: users.length),
          ),
          floatingActionButton: widget.page =="InGroup"?
             FloatingActionButton(
                backgroundColor: AppColors.addedColor,
               onPressed: () {
              if (addGroupUser.isEmpty) {
                EasyLoading.showToast("Please add at least one user for group!",
                    toastPosition: EasyLoadingToastPosition.bottom);
              } else {
                print("Yes added ${addGroupUser.join(",")}");
                var  data = addGroupUser.join(",");
                print("Data  $data");
                addGroupMember(data);
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddGroupInfo(member: data)));
              }
            },
               child: Icon(Icons.check,color: AppColors.appNewDarkThemeColor,),
          )
          :FloatingActionButton(
            backgroundColor: AppColors.appNewLightThemeColor,
            onPressed: () {
              if (addGroupUser.isEmpty) {
                EasyLoading.showToast("Please add at least one user for group!",
                toastPosition: EasyLoadingToastPosition.bottom);
              } else {
                print("Yes added ${addGroupUser.join(",")}");
                var  data = addGroupUser.join(",");
                print("Data  $data");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddGroupInfo(member: data)));
              }
            },
            child: Icon(Icons.arrow_forward,color: Colors.white,),
          )
        ),
      ),
    );
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
                ApiRepository()
                    .addGroupMembers(
                  token: value,
                  groupId: widget.groupId.toString(),
                  members: addMember,
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
