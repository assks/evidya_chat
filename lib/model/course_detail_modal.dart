class CourseDetailModal {
  Body body;
  String status;

  CourseDetailModal({this.body, this.status});

  CourseDetailModal.fromJson(Map<String, dynamic> json) {
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
  Course course;

  Body({this.course});

  Body.fromJson(Map<String, dynamic> json) {
    course =
    json['course'] != null ? new Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.course != null) {
      data['course'] = this.course.toJson();
    }
    return data;
  }
}

class Course {
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
  String rating;
  int ratingCount;
  String views;
  String status;
  String createdAt;
  String updatedAt;

  Course(
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
        this.rating,
        this.ratingCount,
        this.views,
        this.status,
        this.createdAt,
        this.updatedAt});

  Course.fromJson(Map<String, dynamic> json) {
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
    rating = json['rating'];
    ratingCount = json['rating_count'];
    views = json['views'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['rating'] = this.rating;
    data['rating_count'] = this.ratingCount;
    data['views'] = this.views;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}