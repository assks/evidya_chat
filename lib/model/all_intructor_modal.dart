class AllInstructorModal {
  Body body;
  String status;

  AllInstructorModal({this.body, this.status});

  AllInstructorModal.fromJson(Map<String, dynamic> json) {
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
  List<Instructors> instructors;

  Body({this.instructors});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['instructors'] != null) {
      instructors = <Instructors>[];
      json['instructors'].forEach((v) {
        instructors.add(new Instructors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.instructors != null) {
      data['instructors'] = this.instructors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Instructors {
  dynamic id;
  String name;
  String image;
  String occupation;
  String experience;
  String specialization;

  Instructors({this.id, this.name, this.image, this.occupation, this.experience,this.specialization});

  Instructors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    occupation = json['occupation'];
    experience = json['experience'];
    specialization = json['specialization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['occupation'] = this.occupation;
    data['specialization'] = this.specialization;
    data['experience'] = this.experience;
    return data;
  }
}