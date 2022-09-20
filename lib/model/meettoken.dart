/// body : {"meeting":{"appid":"d6306b59624c4e458883be16f5e6cbd2","channel":"BvLXtLlAtgfYMeet","token":"xzM73KwBtDuS8YDNgmzioLTaW6lGg5gDRRGPSriAgIjpQlzvPcvMZCK42UzxG6PW","role":"host","audienceLatency":"1"}}
/// status : "successfull"

class Meettoken {
  Meettoken({
      Body body,
      String status,}){
    _body = body;
    _status = status;
}

  Meettoken.fromJson(dynamic json) {
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
      map['body'] = _body?.toJson();
    }
    map['status'] = _status;
    return map;
  }

}

/// meeting : {"appid":"d6306b59624c4e458883be16f5e6cbd2","channel":"BvLXtLlAtgfYMeet","token":"xzM73KwBtDuS8YDNgmzioLTaW6lGg5gDRRGPSriAgIjpQlzvPcvMZCK42UzxG6PW","role":"host","audienceLatency":"1"}

class Body {
  Body({
      Meeting meeting,}){
    _meeting = meeting;
}

  Body.fromJson(dynamic json) {
    _meeting = json['meeting'] != null ? Meeting.fromJson(json['meeting']) : null;
  }
  Meeting _meeting;

  Meeting get meeting => _meeting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meeting != null) {
      map['meeting'] = _meeting?.toJson();
    }
    return map;
  }

}

/// appid : "d6306b59624c4e458883be16f5e6cbd2"
/// channel : "BvLXtLlAtgfYMeet"
/// token : "xzM73KwBtDuS8YDNgmzioLTaW6lGg5gDRRGPSriAgIjpQlzvPcvMZCK42UzxG6PW"
/// role : "host"
/// audienceLatency : "1"

class Meeting {
  Meeting({
      String appid,
      String channel,
    String name,
      String token,
      String role,
    String status,
      String audienceLatency,}){
    _appid = appid;
    _channel = channel;
    _token = token;
    _role = role;
    _status = status;
    _audienceLatency = audienceLatency;
    _name=name;
}

  Meeting.fromJson(dynamic json) {
    _appid = json['appid'];
    _channel = json['channel'];
    _token = json['token'];
    _role = json['role'];
    _audienceLatency = json['audienceLatency'];
    _name = json['name'];
    _status=json['status'];
  }
  String _appid;
  String _channel;
  String _token;
  String _role;
  String _audienceLatency;
  String _name;
  String _status;

  String get appid => _appid;
  String get channel => _channel;
  String get token => _token;
  String get role => _role;
  String get audienceLatency => _audienceLatency;
  String get name => _name;
  String get status=> _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appid'] = _appid;
    map['name'] = _name;
    map['channel'] = _channel;
    map['token'] = _token;
    map['role'] = _role;
    map['status']=_status;
    map['audienceLatency'] = _audienceLatency;
    return map;
  }

}