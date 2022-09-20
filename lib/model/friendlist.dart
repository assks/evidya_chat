/// body : [{"id":7,"name":"ANIKET KUMAR","email":"aniket@shivalikjournal.com","phone":"9868066089","role":"user","status":"active","email_verified_at":null,"access_token":"$2y$10$aWXKCVVNg1eNWY6y3QOIXOPYyCw3Nf6.oktaqpeOsQnvgsnTrgq2C","created_at":"2021-11-26T05:40:44.000000Z","updated_at":"2021-11-26T05:57:16.000000Z"},{"id":12,"name":"Anik Shrivastava","email":"anik@gmail.com","phone":"9540100010","role":"user","status":"active","email_verified_at":null,"access_token":"$2y$10$HI50vJdnElv55e2foMpPfegf2yLIPBEDuUxRQhwYOgYA9ribJgali","created_at":"2022-01-18T07:05:03.000000Z","updated_at":"2022-01-18T07:05:03.000000Z"},{"id":19,"name":"Aman Shrivastava","email":"anik123@gmail.com","phone":"9540100020","role":"user","status":"active","email_verified_at":null,"access_token":"$2y$10$xfefd7eSzaf38bFeWUzz0uYEWD3XO2CHKlkgq47U9JwsG8voQDOKi","created_at":"2022-03-03T04:34:20.000000Z","updated_at":"2022-03-03T04:34:20.000000Z"}]
/// status : "successful"

class Friendlist {
  Friendlist({
      List<Body> body, 
      String status,}){
    _body = body;
    _status = status;
}

  Friendlist.fromJson(dynamic json) {
    if (json['body'] != null) {
      _body = [];
      json['body'].forEach((v) {
        _body.add(Body.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<Body> _body;
  String _status;

  List<Body> get body => _body;
  String get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_body != null) {
      map['body'] = _body.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// id : 7
/// name : "ANIKET KUMAR"
/// email : "aniket@shivalikjournal.com"
/// phone : "9868066089"
/// role : "user"
/// status : "active"
/// email_verified_at : null
/// access_token : "$2y$10$aWXKCVVNg1eNWY6y3QOIXOPYyCw3Nf6.oktaqpeOsQnvgsnTrgq2C"
/// created_at : "2021-11-26T05:40:44.000000Z"
/// updated_at : "2021-11-26T05:57:16.000000Z"

class Body {
  Body({
      int id, 
      String name, 
      String email, 
      String phone, 
      String role, 
      String status, 
      dynamic emailVerifiedAt, 
      String accessToken, 
      String createdAt, 
      String updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _role = role;
    _status = status;
    _emailVerifiedAt = emailVerifiedAt;
    _accessToken = accessToken;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Body.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _role = json['role'];
    _status = json['status'];
    _emailVerifiedAt = json['email_verified_at'];
    _accessToken = json['access_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int _id;
  String _name;
  String _email;
  String _phone;
  String _role;
  String _status;
  dynamic _emailVerifiedAt;
  String _accessToken;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get role => _role;
  String get status => _status;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String get accessToken => _accessToken;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['role'] = _role;
    map['status'] = _status;
    map['email_verified_at'] = _emailVerifiedAt;
    map['access_token'] = _accessToken;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}