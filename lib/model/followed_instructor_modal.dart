class FollowedInstructorModal {
  List<Body> body;
  String status;

  FollowedInstructorModal({this.body, this.status});

  FollowedInstructorModal.fromJson(Map<String, dynamic> json) {
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
  dynamic instructorId;
  String instructorName;
  String image;
  dynamic experience;
  String specialization;

  Body(
      {this.instructorId,
        this.instructorName,
        this.image,
        this.experience,
        this.specialization});

  Body.fromJson(Map<String, dynamic> json) {
    instructorId = json['instructor_id'];
    instructorName = json['instructor_name'];
    image = json['image'];
    experience = json['experience'];
    specialization = json['specialization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instructor_id'] = this.instructorId;
    data['instructor_name'] = this.instructorName;
    data['image'] = this.image;
    data['experience'] = this.experience;
    data['specialization'] = this.specialization;
    return data;
  }
}