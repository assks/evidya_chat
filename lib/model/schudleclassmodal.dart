/// body : {"user_id":7,"name":"FLUTTER UI BASICS","description":"Learn to create cross plateform APP with grate looking UI","image":"live/94lVpZW2Chy7P603BgvpqimwqbpbJ5AhmWzO01nj.png","status":"scheduled","starts_at":"2021-12-31 16:30","updated_at":"2021-12-31T09:27:33.000000Z","created_at":"2021-12-31T09:27:33.000000Z","id":3}
/// status : "successfulls"

class Schudleclassmodal {
  Schudleclassmodal({
      Body body, 
      String status,}){
    _body = body;
    _status = status;
}

  Schudleclassmodal.fromJson(dynamic json) {
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

/// user_id : 7
/// name : "FLUTTER UI BASICS"
/// description : "Learn to create cross plateform APP with grate looking UI"
/// image : "live/94lVpZW2Chy7P603BgvpqimwqbpbJ5AhmWzO01nj.png"
/// status : "scheduled"
/// starts_at : "2021-12-31 16:30"
/// updated_at : "2021-12-31T09:27:33.000000Z"
/// created_at : "2021-12-31T09:27:33.000000Z"
/// id : 3

class Body {
  Body({
      int userId, 
      String name, 
      String description, 
      String image, 
      String status, 
      String startsAt, 
      String updatedAt, 
      String createdAt, 
      int id,}){
    _userId = userId;
    _name = name;
    _description = description;
    _image = image;
    _status = status;
    _startsAt = startsAt;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Body.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _status = json['status'];
    _startsAt = json['starts_at'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  int _userId;
  String _name;
  String _description;
  String _image;
  String _status;
  String _startsAt;
  String _updatedAt;
  String _createdAt;
  int _id;

  int get userId => _userId;
  String get name => _name;
  String get description => _description;
  String get image => _image;
  String get status => _status;
  String get startsAt => _startsAt;
  String get updatedAt => _updatedAt;
  String get createdAt => _createdAt;
  int get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    map['status'] = _status;
    map['starts_at'] = _startsAt;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}