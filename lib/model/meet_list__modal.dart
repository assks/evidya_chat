import 'package:line_icons/line_icons.dart';

/// body : {"meetings":[{"id":1,"user_id":"1","meeting_id":"3Un9jpZfL3","name":"WEEKLY MEET","description":"Weekly Teachears Meeting","status":"scheduled","stream_channel":null,"stream_token":null,"starts_at":"2022-01-28 17:00:00","created_at":"2022-01-28T03:02:36.000000Z","updated_at":"2022-01-28T03:02:36.000000Z"},{"id":2,"user_id":"1","meeting_id":"TItNG3I7Vv","name":"DAILY ASSESSMENT","description":"Work Flow For Management Section","status":"scheduled","stream_channel":null,"stream_token":null,"starts_at":"2022-01-28 17:30:00","created_at":"2022-01-28T03:31:56.000000Z","updated_at":"2022-01-28T03:31:56.000000Z"}]}
/// status : "successfull"

class MeetList_Modal {
  Body body;
  String status;

  MeetList_Modal({this.body, this.status});

  MeetList_Modal.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

/// meetings : [{"id":1,"user_id":"1","meeting_id":"3Un9jpZfL3","name":"WEEKLY MEET","description":"Weekly Teachears Meeting","status":"scheduled","stream_channel":null,"stream_token":null,"starts_at":"2022-01-28 17:00:00","created_at":"2022-01-28T03:02:36.000000Z","updated_at":"2022-01-28T03:02:36.000000Z"},{"id":2,"user_id":"1","meeting_id":"TItNG3I7Vv","name":"DAILY ASSESSMENT","description":"Work Flow For Management Section","status":"scheduled","stream_channel":null,"stream_token":null,"starts_at":"2022-01-28 17:30:00","created_at":"2022-01-28T03:31:56.000000Z","updated_at":"2022-01-28T03:31:56.000000Z"}]

class Body {
  List<Meetings> meetings;

  Body({this.meetings});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['meetings'] != null) {
      meetings = <Meetings>[];
      json['meetings'].forEach((v) {
        meetings.add( Meetings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meetings != null) {
      data['meetings'] = this.meetings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// id : 1
/// user_id : "1"
/// meeting_id : "3Un9jpZfL3"
/// name : "WEEKLY MEET"
/// description : "Weekly Teachears Meeting"
/// status : "scheduled"
/// stream_channel : null
/// stream_token : null
/// starts_at : "2022-01-28 17:00:00"
/// created_at : "2022-01-28T03:02:36.000000Z"
/// updated_at : "2022-01-28T03:02:36.000000Z"

class Meetings {
  dynamic id;
  dynamic userId;
  String meetingId;
  String name;
  String description;
  String status;
  dynamic streamChannel;
  dynamic streamToken;
  String startsAt;
  String endsAt;
  dynamic createdAt;
  String updatedAt;
  String disable_video;
  String disable_audio;

  Meetings(
      {this.id,
      this.userId,
      this.meetingId,
      this.name,
      this.description,
      this.status,
      this.streamChannel,
      this.streamToken,
      this.startsAt,
      this.endsAt,
      this.createdAt,
      this.updatedAt,
      this.disable_video,
      this.disable_audio});

  Meetings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    meetingId = json['meeting_id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    streamChannel = json['stream_channel'];
    streamToken = json['stream_token'];
    startsAt = json['starts_at'];
    endsAt = json['end_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    disable_video = json['disable_video'];
    disable_audio = json['disable_audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['meeting_id'] = this.meetingId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['status'] = this.status;
    data['stream_channel'] = this.streamChannel;
    data['stream_token'] = this.streamToken;
    data['starts_at'] = this.startsAt;
    data['end_at'] = this.endsAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['disable_video'] = this.disable_video;
    data['disable_audio'] = this.disable_audio;
    return data;
  }
}
