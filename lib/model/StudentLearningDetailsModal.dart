class StudentLearningDetailsModal {
  Body body;
  String status;

  StudentLearningDetailsModal({this.body, this.status});

  StudentLearningDetailsModal.fromJson(Map<String, dynamic> json) {
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
  List<Courses> courses;
  List<Data> data;

  Body({this.courses, this.data});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses.add(new Courses.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courses != null) {
      data['courses'] = this.courses.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  dynamic id;
  dynamic courseId;
  dynamic userId;
  dynamic progress;
  String createdAt;
  String updatedAt;
  String courseName;

  Courses(
      {this.id,
        this.courseId,
        this.userId,
        this.progress,
        this.createdAt,
        this.updatedAt,
        this.courseName});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    userId = json['user_id'];
    progress = json['progress'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    courseName = json['course_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_id'] = this.courseId;
    data['user_id'] = this.userId;
    data['progress'] = this.progress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['course_name'] = this.courseName;
    return data;
  }
}

class Data {
  List<Lessons> lessons;
  int progress;

  Data({this.lessons, this.progress});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons.add(new Lessons.fromJson(v));
      });
    }
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lessons != null) {
      data['lessons'] = this.lessons.map((v) => v.toJson()).toList();
    }
    data['progress'] = this.progress;
    return data;
  }
}

class Lessons {
  dynamic id;
  String name;
  dynamic courseId;
  dynamic userId;
  String description;
  String image;
  String addedBy;
  String status;
  String createdAt;
  String updatedAt;

  Lessons(
      {this.id,
        this.name,
        this.courseId,
        this.userId,
        this.description,
        this.image,
        this.addedBy,
        this.status,
        this.createdAt,
        this.updatedAt});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    courseId = json['course_id'];
    userId = json['user_id'];
    description = json['description'];
    image = json['image'];
    addedBy = json['added_by'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['course_id'] = this.courseId;
    data['user_id'] = this.userId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['added_by'] = this.addedBy;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}