class GetRequestClassList {
  List<Body> body;
  String status;

  GetRequestClassList({this.body, this.status});

  GetRequestClassList.fromJson(Map<String, dynamic> json) {
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body.add(new Body.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Body {
  dynamic id;
  dynamic userId;
  dynamic instructorId;
  String topic;
  String description;
  String date;
  String time;
  String type;
  String createdAt;
  String updatedAt;
  String studentName;

  Body(
      {this.id,
        this.userId,
        this.instructorId,
        this.topic,
        this.description,
        this.date,
        this.time,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.studentName});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    instructorId = json['instructor_id'];
    topic = json['topic'];
    description = json['description'];
    date = json['date'];
    time = json['time'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    studentName = json['student_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['instructor_id'] = this.instructorId;
    data['topic'] = this.topic;
    data['description'] = this.description;
    data['date'] = this.date;
    data['time'] = this.time;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['student_name'] = this.studentName;
    return data;
  }
}