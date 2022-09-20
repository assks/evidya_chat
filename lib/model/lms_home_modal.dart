class LMSHomeModal {
  Body body;
  String status;

  LMSHomeModal({this.body, this.status});

  LMSHomeModal.fromJson(Map<String, dynamic> json) {
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
  List<String> banners;
  List<FeaturedCategories> featuredCategories;
  List<FeaturedCourses> featuredCourses;
  List<PopularCourses> popularCourses;
  List<PopularInstructors> popularInstructors;
  List<LiveClasses> liveClasses;

  Body(
      {this.banners,
        this.featuredCategories,
        this.featuredCourses,
        this.popularCourses,
        this.popularInstructors,
        this.liveClasses});

  Body.fromJson(Map<String, dynamic> json) {
    banners = json['banners'].cast<String>();
    if (json['featured_categories'] != null) {
      featuredCategories = <FeaturedCategories>[];
      json['featured_categories'].forEach((v) {
        featuredCategories.add(new FeaturedCategories.fromJson(v));
      });
    }
    if (json['featured_courses'] != null) {
      featuredCourses = <FeaturedCourses>[];
      json['featured_courses'].forEach((v) {
        featuredCourses.add(new FeaturedCourses.fromJson(v));
      });
    }
    if (json['popular_courses'] != null) {
      popularCourses = <PopularCourses>[];
      json['popular_courses'].forEach((v) {
        popularCourses.add(new PopularCourses.fromJson(v));
      });
    }
    if (json['popular_instructors'] != null) {
      popularInstructors = <PopularInstructors>[];
      json['popular_instructors'].forEach((v) {
        popularInstructors.add(new PopularInstructors.fromJson(v));
      });
    }
    if (json['live_classes'] != null) {
      liveClasses = <LiveClasses>[];
      json['live_classes'].forEach((v) {
        liveClasses.add(new LiveClasses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banners'] = this.banners;
    if (this.featuredCategories != null) {
      data['featured_categories'] =
          this.featuredCategories.map((v) => v.toJson()).toList();
    }
    if (this.featuredCourses != null) {
      data['featured_courses'] =
          this.featuredCourses.map((v) => v.toJson()).toList();
    }
    if (this.popularCourses != null) {
      data['popular_courses'] =
          this.popularCourses.map((v) => v.toJson()).toList();
    }
    if (this.popularInstructors != null) {
      data['popular_instructors'] =
          this.popularInstructors.map((v) => v.toJson()).toList();
    }
    if (this.liveClasses != null) {
      data['live_classes'] = this.liveClasses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturedCategories {
  dynamic id;
  String name;
  String image;

  FeaturedCategories({this.id, this.name, this.image});

  FeaturedCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class FeaturedCourses {
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

  FeaturedCourses(
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
        this.instructorImage});

  FeaturedCourses.fromJson(Map<String, dynamic> json) {
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
    data['instructor_name'] = this.instructorName;
    data['instructor_image'] = this.instructorImage;
    return data;
  }
}

class PopularCourses {
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

  PopularCourses(
      { this.id,
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
        this.instructorImage
      });

  PopularCourses.fromJson(Map<String, dynamic> json) {
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
    data['instructor_name'] = this.instructorName;
    data['instructor_image'] = this.instructorImage;
    return data;
  }
}


class PopularInstructors {
  dynamic id;
  String name;
  String image;
  String occupation;
  String experience;
  String specialization;

  PopularInstructors(
      {this.id,
        this.name,
        this.image,
        this.occupation,
        this.experience,
        this.specialization});

  PopularInstructors.fromJson(Map<String, dynamic> json) {
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

class LiveClasses {
  dynamic id;
  dynamic userId;
  String name;
  String description;
  String image;
  String status;
  String startsAt;

  LiveClasses(
      {this.id,
        this.userId,
        this.name,
        this.description,
        this.image,
        this.status,
        this.startsAt});

  LiveClasses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    startsAt = json['starts_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['starts_at'] = this.startsAt;
    return data;
  }
}