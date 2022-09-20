import 'package:evidya/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../localdb/databasehelper.dart';
import '../livestreaming/broadcast/logs.dart';

class CallHistoryScreen extends StatefulWidget {
  const CallHistoryScreen({Key key}) : super(key: key);

  @override
  _CallHistoryScreenState createState() => _CallHistoryScreenState();
}

class _CallHistoryScreenState extends State<CallHistoryScreen> {
  final dbHelper = DatabaseHelper.instance;
  LogController logController = LogController();
  var day;
  @override
  void initState()  {
    _query();
    super.initState();
  }

  Future<void> _query() async {
    final allRows = await dbHelper.AllRows();
    for (var row in allRows) {
      { if (row != null)
      { logController.addLog(row["calleeName"] + "#@####@#" + row["calltype"] + "#@####@#" + row["Calldrm"] +"#@####@#" + row["timestamp"] );}}
    }
  }

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;
    print('adas$logController');
    return Container(
        height: 100.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back_ground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.appNewDarkThemeColor,
            centerTitle: true,
            title: Text("Call History"),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 2.h,left: 1.h,right: 1.h),
              child: Container(
                height: 100.h,
                padding: EdgeInsets.only(top: 2.h,left: 2.h,right: 2.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/grey_background.jpg",),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child:ValueListenableBuilder(
                    valueListenable: logController,
                    builder: (context, log, widget) {
                      if(log.length == 0){
                        return Center(child: Text("No Recent Call History!",style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.sp
                        ),),);
                      }else{
                        return ListView.builder(
                            itemCount: log.length,
                            itemBuilder: (context, index) {
                              dynamic parts = log[index].split('#@####@#');
                              day = DateTime.now().difference(DateTime(DateTime.parse(parts[3]).year,DateTime.parse(parts[3]).month,DateTime.parse(parts[3]).day)).inDays;
                              print("Data $day");
                              return Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: AppColors.appNewDarkThemeColor,
                                      radius: 20,
                                      child: Text(
                                          parts[0].toString().substring(0,1),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,
                                              fontSize: 15.sp)
                                      ),
                                    ),
                                    Expanded(child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(parts[0],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.bold)),
                                              Row(
                                                children: [
                                                  parts[2] =="Dilled_Call"?
                                                  Icon(Icons.call_made_outlined,size: 15,color: Colors.green,)
                                                      : parts[2] =="Received_Call"
                                                      ? Icon(Icons.call_received_sharp,size: 15,color: Colors.green,)
                                                      :Icon(Icons.call_received_sharp,size: 15,color: Colors.red,),

                                                  SizedBox(width: 5,),
                                                  Text(
                                                      day == 0
                                                          ? 'Today'
                                                          : day == 1
                                                          ? 'Yesterday'
                                                          : DateFormat('EEE, MMM d').format(DateTime.parse(parts[3].toString())).toString(),
                                                      style:  TextStyle(fontSize: 10.sp, color: Colors.grey)),
                                                  Text(DateFormat(', hh:mm a').format(DateTime.parse(parts[3])),
                                                      style:  TextStyle(fontSize: 10.sp, color: Colors.grey)),
                                                ],
                                              )

                                            ],
                                          ),
                                        ),
                                        parts[1] =="audio"
                                            ? Image.asset("assets/icons/svg/call.png",height: 2.5.h,width: 2.5.h,color:Colors.black26,)
                                            :Image.asset("assets/icons/svg/camera.png",height: 3.h,width: 3.h,color:Colors.black26),
                                        // getWidget(log,filterdUsers[i].badge, filterdUsers[i].peerId),
                                      ],
                                    ))
                                  ],
                                ),
                              );



                            });
                      }
                    }
                ),
              ),
            ),
          ),
        ));
  }
}
