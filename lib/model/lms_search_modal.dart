class LMSSearchModal {
  Body body;
  String status;

  LMSSearchModal({this.body, this.status});

  LMSSearchModal.fromJson(Map<String, dynamic> json) {
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
  List<Instructors> instructors;

  Body({this.courses, this.instructors});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses.add(new Courses.fromJson(v));
      });
    }
    if (json['instructors'] != null) {
      instructors = <Instructors>[];
      json['instructors'].forEach((v) {
        instructors.add(new Instructors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courses != null) {
      data['courses'] = this.courses.map((v) => v.toJson()).toList();
    }
    if (this.instructors != null) {
      data['instructors'] = this.instructors.map((v) => v.toJson()).toList();
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
  String level;
  String language;
  String duration;
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
        this.level,
        this.language,
        this.duration,
        this.image,
        this.slug,
        this.createdAt,
        this.updatedAt,
        this.instructorName,
        this.instructorImage,
      });

  Courses.fromJson(Map<String, dynamic> json) {
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
    data['level'] = this.level;
    data['language'] = this.language;
    data['duration'] = this.duration;
    data['image'] = this.image;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['instructor_image'] = this.instructorImage;
    data['instructor_name'] = this.instructorName;
    return data;
  }
}

class Instructors {
  dynamic id;
  String name;
  String image;
  String occupation;
  dynamic experience;
  String specialization;

  Instructors(
      {this.id,
        this.name,
        this.image,
        this.occupation,
        this.experience,
        this.specialization});

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
    data['experience'] = this.experience;
    data['specialization'] = this.specialization;
    return data;
  }
}