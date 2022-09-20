class CoursesModal {
  Body body;
  String status;

  CoursesModal({this.body, this.status});

  CoursesModal.fromJson(Map<String, dynamic> json) {
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

  Body({this.courses});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courses != null) {
      data['courses'] = this.courses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  dynamic id;
  String name;
  dynamic categoryId;
  dynamic subcategoryId;
  dynamic userId;
  String description;
  String objective;
  String benefit;
  String audience;
  String level;
  String language;
  String duration;
  String numberOfLesson;
  String image;
  String slug;
  String createdAt;
  String updatedAt;
  String instructorName;
  String instructorImage;

  Courses(
      {this.id,
        this.name,
        this.categoryId,
        this.subcategoryId,
        this.userId,
        this.description,
        this.objective,
        this.benefit,
        this.audience,
        this.level,
        this.language,
        this.duration,
        this.numberOfLesson,
        this.image,
        this.slug,
        this.createdAt,
        this.updatedAt,
        this.instructorName,
        this.instructorImage});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    userId = json['user_id'];
    description = json['description'];
    objective = json['objective'];
    benefit = json['benefit'];
    audience = json['audience'];
    level = json['level'];
    language = json['language'];
    duration = json['duration'];
    numberOfLesson = json['number_of_lesson'];
    image = json['image'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    instructorName = json['instructor_name'];
    instructorImage = json['instructor_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['user_id'] = this.userId;
    data['description'] = this.description;
    data['objective'] = this.objective;
    data['benefit'] = this.benefit;
    data['audience'] = this.audience;
    data['level'] = this.level;
    data['language'] = this.language;
    data['duration'] = this.duration;
    data['number_of_lesson'] = this.numberOfLesson;
    data['image'] = this.image;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['instructor_name'] = this.instructorName;
    data['instructor_image'] = this.instructorImage;
    return data;
  }
}