/// body : {"appid":"d6306b59624c4e458883be16f5e6cbd2","call_id":"odH5Ghe7HF3ZlB2d5o1Y","caller_name":"KUNAL PANDEY","callee_name":"PRASHANT","call_channel":"qPjPVGHdtkBZx4QfqC6j","call_token":"LihBE6w7HzXy9cgJqWoAHkFgCrM8WEwXvWcJUSS0GddNyJ1wg59OW9HnagVOlIlU"}
/// status : "successfull"

class VideocallModal {
  VideocallModal({
      Body body, 
      String status,}){
    _body = body;
    _status = status;
}

  VideocallModal.fromJson(dynamic json) {
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
    _status = json['status'];
  }
  Body _body;
  String _status;

  Body get body => _body;
  String get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_body != null) {
      map['body'] = _body.toJson();
    }
    map['status'] = _status;
    return map;
  }

}

/// appid : "d6306b59624c4e458883be16f5e6cbd2"
/// call_id : "odH5Ghe7HF3ZlB2d5o1Y"
/// caller_name : "KUNAL PANDEY"
/// callee_name : "PRASHANT"
/// call_channel : "qPjPVGHdtkBZx4QfqC6j"
/// call_token : "LihBE6w7HzXy9cgJqWoAHkFgCrM8WEwXvWcJUSS0GddNyJ1wg59OW9HnagVOlIlU"

class Body {
  Body({
      String appid, 
      String callId, 
      String callerName, 
      String calleeName, 
      String callChannel, 
      String callToken,}){
    _appid = appid;
    _callId = callId;
    _callerName = callerName;
    _calleeName = calleeName;
    _callChannel = callChannel;
    _callToken = callToken;
}

  Body.fromJson(dynamic json) {
    _appid = json['appid'];
    _callId = json['call_id'];
    _callerName = json['caller_name'];
    _calleeName = json['callee_name'];
    _callChannel = json['call_channel'];
    _callToken = json['call_token'];
  }
  String _appid;
  String _callId;
  String _callerName;
  String _calleeName;
  String _callChannel;
  String _callToken;

  String get appid => _appid;
  String get callId => _callId;
  String get callerName => _callerName;
  String get calleeName => _calleeName;
  String get callChannel => _callChannel;
  String get callToken => _callToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appid'] = _appid;
    map['call_id'] = _callId;
    map['caller_name'] = _callerName;
    map['callee_name'] = _calleeName;
    map['call_channel'] = _callChannel;
    map['call_token'] = _callToken;
    return map;
  }

}