class LiveClassModal {
  Body body;
  String status;

  LiveClassModal({this.body, this.status});

  LiveClassModal.fromJson(Map<String, dynamic> json) {
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
  List<LiveClasses> liveClasses;

  Body({this.liveClasses});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['live_classes'] != null) {
      liveClasses = <LiveClasses>[];
      json['live_classes'].forEach((v) {
        liveClasses.add(new LiveClasses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.liveClasses != null) {
      data['live_classes'] = this.liveClasses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LiveClasses {
  dynamic id;
  dynamic userId;
  dynamic streamId;
  String name;
  String description;
  String image;
  String status;
  String startsAt;

  LiveClasses(
      {this.id,
        this.userId,
        this.streamId,
        this.name,
        this.description,
        this.image,
        this.status,
        this.startsAt});

  LiveClasses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    streamId = json['stream_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    startsAt = json['starts_at'];
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
    data['starts_at'] = this.startsAt;
    return data;
  }
}