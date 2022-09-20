/// body : {"appid":"d6306b59624c4e458883be16f5e6cbd2","rtm_channel":"Bv47015341124b6aabf38efdfa4ddb0ea7","rtm_token":"006d6306b59624c4e458883be16f5e6cbd2IACrxtpNDoUwekY4gN3f4ENp6YzAhibVVYIxwtXxNZw31RS1uMAAAAAAEAAtHgAAIFQCYgEA6AOoCQFi","rtm_user":"ANIK SHRIVASTAVA (USER:4294967307)"}
/// status : "successfull"

class RtmTokenModel {
  RtmTokenModel({
    RtmToken body,
      String status,}){
    _body = body;
    _status = status;
}

  RtmTokenModel.fromJson(dynamic json) {
    _body = json['body'] != null ? RtmToken.fromJson(json['body']) : null;
    _status = json['status'];
  }
  RtmToken _body;
  String _status;

  RtmToken get body => _body;
  String get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_body != null) {
      map['body'] = _body?.toJson();
    }
    map['status'] = _status;
    return map;
  }

}

/// appid : "d6306b59624c4e458883be16f5e6cbd2"
/// rtm_channel : "Bv47015341124b6aabf38efdfa4ddb0ea7"
/// rtm_token : "006d6306b59624c4e458883be16f5e6cbd2IACrxtpNDoUwekY4gN3f4ENp6YzAhibVVYIxwtXxNZw31RS1uMAAAAAAEAAtHgAAIFQCYgEA6AOoCQFi"
/// rtm_user : "ANIK SHRIVASTAVA (USER:4294967307)"

class RtmToken {
  RtmToken({
      String appid,
      String rtmChannel,
      String rtmToken,
      String rtmUser,}){
    _appid = appid;
    _rtmChannel = rtmChannel;
    _rtmToken = rtmToken;
    _rtmUser = rtmUser;
}

  RtmToken.fromJson(dynamic json) {
    _appid = json['appid'];
    _rtmChannel = json['rtm_channel'];
    _rtmToken = json['rtm_token'];
    _rtmUser = json['rtm_user'];
  }
  String _appid;
  String _rtmChannel;
  String _rtmToken;
  String _rtmUser;

  String get appid => _appid;
  String get rtmChannel => _rtmChannel;
  String get rtmToken => _rtmToken;
  String get rtmUser => _rtmUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appid'] = _appid;
    map['rtm_channel'] = _rtmChannel;
    map['rtm_token'] = _rtmToken;
    map['rtm_user'] = _rtmUser;
    return map;
  }

}