
class LivetokenModel {
  Body body;
  String status;

  LivetokenModel({this.body, this.status});

  LivetokenModel.fromJson(Map<String, dynamic> json) {
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

class Body {
  LiveClass liveClass;

  Body({this.liveClass});

  Body.fromJson(Map<String, dynamic> json) {
    liveClass = json['live_class'] != null
        ? new LiveClass.fromJson(json['live_class'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.liveClass != null) {
      data['live_class'] = this.liveClass.toJson();
    }
    return data;
  }
}

class LiveClass {
  dynamic id;
  dynamic userId;
  String streamId;
  String name;
  String description;
  String image;
  String status;
  String roomType;
  String roomStatus;
  String streamChannel;
  String streamToken;
  String recorderToken;
  String startsAt;
  String createdAt;
  String updatedAt;

  LiveClass(
      {this.id,
        this.userId,
        this.streamId,
        this.name,
        this.description,
        this.image,
        this.status,
        this.roomType,
        this.roomStatus,
        this.streamChannel,
        this.streamToken,
        this.recorderToken,
        this.startsAt,
        this.createdAt,
        this.updatedAt});

  LiveClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    streamId = json['stream_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    roomType = json['room_type'];
    roomStatus = json['room_status'];
    streamChannel = json['stream_channel'];
    streamToken = json['stream_token'];
    recorderToken = json['recorder_token'];
    startsAt = json['starts_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['stream_id'] = this.streamId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['room_type'] = this.roomType;
    data['room_status'] = this.roomStatus;
    data['stream_channel'] = this.streamChannel;
    data['stream_token'] = this.streamToken;
    data['recorder_token'] = this.recorderToken;
    data['starts_at'] = this.startsAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}