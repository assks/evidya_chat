class InstructorCourseModal {
  List<Body> body;
  String status;

  InstructorCourseModal({this.body, this.status});

  InstructorCourseModal.fromJson(Map<String, dynamic> json) {
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
  String name;
  dynamic categoryId;
  dynamic subcategoryId;
  dynamic userId;
  String description;
  String level;
  String language;
  String duration;
  String image;
  String slug;
  dynamic rating;
  dynamic ratingCount;
  dynamic views;
  String status;
  String createdAt;
  String updatedAt;

  Body(
      {this.id,
        this.name,
        this.categoryId,
        this.subcategoryId,
        this.userId,
        this.description,
        this.level,
        this.language,
        this.duration,
        this.image,
        this.slug,
        this.rating,
        this.ratingCount,
        this.views,
        this.status,
        this.createdAt,
        this.updatedAt});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    userId = json['user_id'];
    description = json['description'];
    level = json['level'];
    language = json['language'];
    duration = json['duration'];
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
    data['level'] = this.level;
    data['language'] = this.language;
    data['duration'] = this.duration;
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