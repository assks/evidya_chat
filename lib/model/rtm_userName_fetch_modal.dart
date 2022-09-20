class RTMUserNameFetchModal {
  String appid;
  String rtmToken;
  String rtmUser;

  RTMUserNameFetchModal({this.appid, this.rtmToken, this.rtmUser});

  RTMUserNameFetchModal.fromJson(Map<String, dynamic> json) {
    appid = json['appid'];
    rtmToken = json['rtm_token'];
    rtmUser = json['rtm_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appid'] = this.appid;
    data['rtm_token'] = this.rtmToken;
    data['rtm_user'] = this.rtmUser;
    return data;
  }
}