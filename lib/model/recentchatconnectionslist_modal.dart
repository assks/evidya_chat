/// body : {"connections":[{"id":"1","name":"KUNAL PANDEY","peer_id":"4294967296","status":"active"},{"id":"2","name":"ARUN JOSHI","peer_id":"4294967297","status":"active"},{"id":"3","name":"KUNAL PANDEY","peer_id":"4294967298","status":"active"},{"id":"7","name":"ANIKET KUMAR","peer_id":"4294967302","status":"active"}]}
/// status : "successfull"

class RecentchatconnectionslistModal {
  RecentchatconnectionslistModal({
    Body body,
    String status,
  }) {
    _body = body;
    _status = status;
  }

  RecentchatconnectionslistModal.fromJson(dynamic json) {
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

/// connections : [{"id":"1","name":"KUNAL PANDEY","peer_id":"4294967296","status":"active"},{"id":"2","name":"ARUN JOSHI","peer_id":"4294967297","status":"active"},{"id":"3","name":"KUNAL PANDEY","peer_id":"4294967298","status":"active"},{"id":"7","name":"ANIKET KUMAR","peer_id":"4294967302","status":"active"}]

class Body {
  Body({
    List<Connections> connections,
  }) {
    _connections = connections;
  }

  Body.fromJson(dynamic json) {
    if (json['connections'] != null) {
      _connections = [];
      json['connections'].forEach((v) {
        _connections.add(Connections.fromJson(v));
      });
    }
  }

  List<Connections> _connections;

  List<Connections> get connections => _connections;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_connections != null) {
      map['connections'] = _connections.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "1"
/// name : "KUNAL PANDEY"
/// peer_id : "4294967296"
/// status : "active"
/// badge: 1

class Connections {
  Connections(
      {dynamic id,
      String name,
      dynamic peerId,
      String status,
      dynamic badge,
      dynamic timeStamp,
      String profile_image,
      String email,
      dynamic phone,
      String fcm_token}) {
    _id = id;
    _name = name;
    _peerId = peerId;
    _status = status;
    _badge = badge;
    _timeStamp = timeStamp;
    _profile_image=profile_image;
    _email=email;
    _phone=phone;
    _fcm_token = fcm_token;
  }

  set id(dynamic value) {
    _id = value;
  }

  Connections.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _peerId = json['peer_id'];
    _status = json['status'];
    _badge = json['badge'];
    _timeStamp = json['timestamp'];
    _profile_image = json['profile_image'];
    _email = json['email'];
    _phone = json['phone'];
    _fcm_token = json['fcm_token'];
  }

  dynamic _id;
  String _name;
  dynamic _peerId;
  String _status;
  dynamic _badge;
  String _fcm_token;
  dynamic _timeStamp;
  String _profile_image;
  String _email;
  dynamic _phone;


  dynamic get id => _id;

  String get name => _name;

  dynamic get peerId => _peerId;

  String get status => _status;

  dynamic get badge => _badge;

  dynamic get timeStamp => _timeStamp;

  String get fcm_token => _fcm_token;
  String get profile_image => _profile_image;
  String get email => _email;
  dynamic get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['peer_id'] = _peerId;
    map['status'] = _status;
    map['badge'] = _badge;
    map['timestamp'] = _timeStamp;
    map['phone']= _phone;
    map['profile_image']=_profile_image;
    map['email']=_email;
    map['fcm_token'] = _fcm_token;
    return map;
  }

  set name(String value) {
    _name = value;
  }

  set peerId(String value) {
    _peerId = value;
  }

  set status(String value) {
    _status = value;
  }

  set badge(dynamic value) {
    _badge = value;
  }
  set timeStamp(dynamic value) {
    _timeStamp = value;
  }
  set fcm_token(String value) {
    _fcm_token = value;
  }
  set profile_image(String value) {
    _profile_image = value;
  }
  set phone(dynamic value) {
    _phone = value;
  }
  set email(String value) {
    _email = value;
  }
}
