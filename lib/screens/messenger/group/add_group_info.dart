import 'dart:io';

import 'package:evidya/constants/string_constant.dart';
import 'package:evidya/network/repository/api_repository.dart';
import 'package:evidya/resources/app_colors.dart';
import 'package:evidya/sharedpref/preference_connector.dart';
import 'package:evidya/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:sizer/sizer.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../tabview.dart';
class AddGroupInfo extends StatefulWidget {
  final String member;

  const AddGroupInfo({this.member, Key key}) : super(key: key);

  @override
  State<AddGroupInfo> createState() => _AddGroupInfoState();
}

class _AddGroupInfoState extends State<AddGroupInfo> {
  File _image;
  final _formKey = GlobalKey<FormState>();
  TextEditingController groupNameController = TextEditingController();
  TextEditingController groupDescController = TextEditingController();
  ImageCropper imageCropper= ImageCropper();
  ImagePicker picker = ImagePicker();
  FlutterImageCompress compresser = FlutterImageCompress() ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/back_ground.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.appNewDarkThemeColor,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Group Info",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
          ),
          body: Container(
            margin:
                EdgeInsets.only(top: 1.h, right: 1.h, left: 1.h, bottom: 1.h),
            padding:
                EdgeInsets.only(left: 2.h, right: 2.h, top: 3.h, bottom: 2.h),
            height: 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/grey_background.jpg",
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 5, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.white),
                          color: _image != null
                              ? Colors.transparent
                              : Colors.white,
                        ),
                        child: _image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  _image,
                                  height: 12.h,
                                  width: 25.w,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/teacher.PNG',
                                  height: 12.h,
                                  width: 25.w,
                                  fit: BoxFit.fill,
                                ),
                              )),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/icons/svg/camera_flip.png',
                                height: 2.h,
                                color: Color(0xFF5c0e35),
                              )),
                          onTap: () {
                            _selectImage(context);
                          },
                        )),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          Icon(Icons.supervisor_account_sharp),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add Group Name",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        autofocus: false,
                        cursorColor: Colors.black,
                        controller: groupNameController,
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter group name',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10.sp),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Add the group name!';
                          } else if (value.length < 10) {
                            return 'Group Name at least contain 10 characters!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                        height: 1,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Icon(Icons.description),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Group Description",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        autofocus: false,
                        cursorColor: Colors.black,
                        controller: groupDescController,
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter description',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10.sp),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Description here !';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                        height: 1,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.redColor,
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.appNewLightThemeColor,
                              AppColors.appNewDarkThemeColor,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (_image == null) {
                        EasyLoading.showToast("Group Profile Image is missing.");
                      } else if (_formKey.currentState.validate()) {
                        EasyLoading.show();
                        createMessengerGroup();
                      } else {
                        EasyLoading.showToast("Error! Something Missing");
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectImage(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                 ListTile(
                    leading:  const Icon(Icons.photo_library),
                    title:  const Text('Photo Library'),
                    onTap: () {
                      //_imgFromGallery();
                      _getImage(2);
                     Navigator.of(context).pop();
                    }),
                 ListTile(
                  leading:  const Icon(Icons.photo_camera),
                  title:  const Text('Camera'),
                  onTap: () {
                    //_imgFromCamera();
                    _getImage(1);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future _getImage(int type) async {

    var image = await picker.pickImage(
        source: type == 1 ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50
    );
    var croppedFile = await imageCropper.cropImage(
      sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
    );

/*    var compressedFile = await FlutterImageCompress.compressAndGetFile(
      croppedFile.path,
      croppedFile.path,
      quality: 50,
    );*/

    setState(() {
      _image = File(croppedFile.path);
    });
  }



 /* _imgFromGallery() async {
    XFile image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 25.w,
        maxHeight: 12.h);
    setState(() {
      _image = File(image.path);
    });
  }*/

/*  _imgFromCamera() async {
    XFile image = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 25.w,
        maxHeight: 12.h,
        imageQuality: 50);
    setState(() {
      _image = File(image.path);
      ;
    });
  }*/

  void createMessengerGroup() {
    Helper.checkConnectivity().then((value) => {
          if (value)
            {
              PreferenceConnector.getJsonToSharedPreference(
                      StringConstant.loginData)
                  .then((value) => {
                        if (value != null)
                          {
                            ApiRepository().createGroup(
                              token: value,
                              groupName: groupNameController.text,
                              groupDescription: groupDescController.text,
                              groupMember: widget.member,
                              image: _image,
                            )
                                .then((value) {
                              if (value['status'] == "successfull") {
                                EasyLoading.dismiss();
                                print("Success $value");
                                setState(() {
                                  EasyLoading.showToast("Group Created",
                                      toastPosition:
                                          EasyLoadingToastPosition.bottom,
                                      duration: const Duration(seconds: 2));
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
                                EasyLoading.showToast(value['message']
                                );
                              }
                            })
                          }
                        else
                          {
                            EasyLoading.dismiss(),
                            EasyLoading.showToast("Something went wrong please logout and login again.", toastPosition: EasyLoadingToastPosition.bottom, duration: const Duration(seconds: 2))
                          }
                      })
            }
          else
            {Helper.showNoConnectivityDialog(context)}
        });
  }
}
