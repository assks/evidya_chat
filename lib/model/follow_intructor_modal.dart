class FollowInstructorModal {
  List<Body> body;
  String status;

  FollowInstructorModal({this.body, this.status});

  FollowInstructorModal.fromJson(Map<String, dynamic> json) {
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
  dynamic instructorId;
  dynamic userId;
  String createdAt;
  String updatedAt;

  Body(
      {this.id,
        this.instructorId,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instructorId = json['instructor_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instructor_id'] = this.instructorId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}