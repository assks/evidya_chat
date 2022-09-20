/// body : {"appid":"d6306b59624c4e458883be16f5e6cbd2","rtm_token":"006d6306b59624c4e458883be16f5e6cbd2IABCEMeCNfdG7zEGZ/IxYLwIcOuesISoPciS3UGHFd6FOdBpiq8AAAAAEAC8SwAAf9oqYgEA6AMHkCli","rtm_user":"ARUN JOSHI (USER:4294967297)"}
/// status : "successfull"

class RtmtokenModal {
  RtmtokenModal({
      String message,
      Body body, 
      String status,}){
    _body = body;
    _status = status;
    _message = message;
}

  RtmtokenModal.fromJson(dynamic json) {
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
    _status = json['status'];
    _message = json['message'];
  }
  Body _body;
  String _status;
  String _message;

  Body get body => _body;
  String get status => _status;
  String get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_body != null) {
      map['body'] = _body.toJson();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}

/// appid : "d6306b59624c4e458883be16f5e6cbd2"
/// rtm_token : "006d6306b59624c4e458883be16f5e6cbd2IABCEMeCNfdG7zEGZ/IxYLwIcOuesISoPciS3UGHFd6FOdBpiq8AAAAAEAC8SwAAf9oqYgEA6AMHkCli"
/// rtm_user : "ARUN JOSHI (USER:4294967297)"

class Body {
  Body({
      String appid, 
      String rtmToken, 
      String rtmUser,
    String message,
      String rtmpeerid}){
    _appid = appid;
    _rtmToken = rtmToken;
    _rtmUser = rtmUser;
    _rtmpeerid =rtmpeerid;
    _message= message;
}

  Body.fromJson(dynamic json) {
    _appid = json['appid'];
    _rtmToken = json['rtm_token'];
    _rtmUser = json['rtm_user'];
    _rtmpeerid = json['rtm_peer_id'];
    _message = json['message'];
  }
  String _appid;
  String _rtmToken;
  String _rtmUser;
  String _rtmpeerid;
  String _message;

  String get appid => _appid;
  String get rtmToken => _rtmToken;
  String get rtmUser => _rtmUser;
  String get rtmpeerid => _rtmpeerid;
  String get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appid'] = _appid;
    map['rtm_token'] = _rtmToken;
    map['rtm_user'] = _rtmUser;
    map['rtm_peer_id'] = _rtmpeerid;
    map['message']=_message;
    return map;
  }

}