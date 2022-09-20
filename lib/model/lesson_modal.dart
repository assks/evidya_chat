class LessonModal {
  Body body;
  String status;

  LessonModal({this.body, this.status});

  LessonModal.fromJson(Map<String, dynamic> json) {
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
  List<Lessons> lessons;

  Body({this.lessons});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons.add(new Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lessons != null) {
      data['lessons'] = this.lessons.map((v) => v.toJson()).toList();
    }
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
  dynamic videoId;
  String duration;
  String createdAt;
  String updatedAt;
  String videoUrl;

  Lessons(
      {this.id,
        this.name,
        this.courseId,
        this.userId,
        this.description,
        this.image,
        this.videoId,
        this.duration,
        this.createdAt,
        this.updatedAt,
        this.videoUrl});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    courseId = json['course_id'];
    userId = json['user_id'];
    description = json['description'];
    image = json['image'];
    videoId = json['video_id'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    videoUrl = json['video_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['course_id'] = this.courseId;
    data['user_id'] = this.userId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['video_id'] = this.videoId;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['video_url'] = this.videoUrl;
    return data;
  }
}