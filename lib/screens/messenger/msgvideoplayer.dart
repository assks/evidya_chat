import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../resources/app_colors.dart';

class Msgvideoplayer extends StatefulWidget {
  final String videourl;
  const Msgvideoplayer({this.videourl,Key key}) : super(key: key);

  @override
  State<Msgvideoplayer> createState() => _MsgvideoplayerState();
}

class _MsgvideoplayerState extends State<Msgvideoplayer> {
  FlickManager flickManager;
  dynamic uri;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     uri = widget.videourl.split('#@#&');
    flickManager = FlickManager(videoPlayerController: VideoPlayerController.contentUri(Uri.parse(uri[0])));
    flickManager.flickVideoManager.addListener(_videoPlayingListener);
    const FlickTotalDuration(color: Colors.lightBlueAccent);
    var a=  flickManager.flickVideoManager.videoPlayerValue.position;
    var b= flickManager.flickVideoManager.videoPlayerValue.duration;
    print(a+b);
  }
  @override
  void dispose() {
    flickManager.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          centerTitle: true,title: Text(uri[1])),
      body: FlickVideoPlayer(
          flickManager: flickManager,
          preferredDeviceOrientation: [
            DeviceOrientation.portraitDown,
            DeviceOrientation.portraitUp
          ]
      ),
    );
  }
  _videoPlayingListener() async {
    if (flickManager.flickVideoManager.isVideoInitialized) {
      var a=flickManager.flickVideoManager.videoPlayerValue.position;
      print(a.toString().substring(0,7));
      var  trimtime = a.toString().substring(0,7);

    }
  }
}
