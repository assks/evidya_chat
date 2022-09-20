/// body : {"user_id":16,"meeting_id":"zjE0ZmNtqC","name":"INSTANT MEET","description":"Mobile Application","status":"scheduled","starts_at":"1970-01-01 00:00","ends_at":"1970-01-01 00:00","repeats":"0","disable_video":"0","disable_audio":"0","updated_at":"2022-04-14T07:54:15.000000Z","created_at":"2022-04-14T07:54:15.000000Z","id":26}
/// status : "successfull"

class Schudlemeet {
  Schudlemeet({
      Body body, 
      String status,}){
    _body = body;
    _status = status;
}

  Schudlemeet.fromJson(dynamic json) {
    _body = json['body'] == null ? [] : Body.fromJson(json['body']);
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

/// user_id : 16
/// meeting_id : "zjE0ZmNtqC"
/// name : "INSTANT MEET"
/// description : "Mobile Application"
/// status : "scheduled"
/// starts_at : "1970-01-01 00:00"
/// ends_at : "1970-01-01 00:00"
/// repeats : "0"
/// disable_video : "0"
/// disable_audio : "0"
/// updated_at : "2022-04-14T07:54:15.000000Z"
/// created_at : "2022-04-14T07:54:15.000000Z"
/// id : 26

class Body {
  Body({
      dynamic userId,
      String meetingId, 
      String name, 
      String description, 
      String status, 
      String startsAt, 
      String endsAt, 
      dynamic repeats,
    dynamic disableVideo,
    dynamic disableAudio,
      String updatedAt, 
      String createdAt, 
      int id,}){
    _userId = userId;
    _meetingId = meetingId;
    _name = name;
    _description = description;
    _status = status;
    _startsAt = startsAt;
    _endsAt = endsAt;
    _repeats = repeats;
    _disableVideo = disableVideo;
    _disableAudio = disableAudio;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Body.fromJson(dynamic json) {
    _userId = json['user_id'];
    _meetingId = json['meeting_id'];
    _name = json['name'];
    _description = json['description'];
    _status = json['status'];
    _startsAt = json['starts_at'];
    _endsAt = json['ends_at'];
    _repeats = json['repeats'];
    _disableVideo = json['disable_video'];
    _disableAudio = json['disable_audio'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  dynamic _userId;
  String _meetingId;
  String _name;
  String _description;
  String _status;
  String _startsAt;
  String _endsAt;
  dynamic _repeats;
  dynamic _disableVideo;
  dynamic _disableAudio;
  String _updatedAt;
  String _createdAt;
  int _id;

  dynamic get userId => _userId;
  String get meetingId => _meetingId;
  String get name => _name;
  String get description => _description;
  String get status => _status;
  String get startsAt => _startsAt;
  String get endsAt => _endsAt;
  dynamic get repeats => _repeats;
  dynamic get disableVideo => _disableVideo;
  dynamic get disableAudio => _disableAudio;
  String get updatedAt => _updatedAt;
  String get createdAt => _createdAt;
  int get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['meeting_id'] = _meetingId;
    map['name'] = _name;
    map['description'] = _description;
    map['status'] = _status;
    map['starts_at'] = _startsAt;
    map['ends_at'] = _endsAt;
    map['repeats'] = _repeats;
    map['disable_video'] = _disableVideo;
    map['disable_audio'] = _disableAudio;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}