

class Homemodal {
  Body body;
  String status;

  Homemodal({this.body, this.status});

  Homemodal.fromJson(Map<String, dynamic> json) {
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
  List<FeaturedCategory> featuredCategory;

  List<LiveClasses> liveClasses;
  List<OngoingClasses> ongoingClasses;
  List<BestInstructors> bestInstructors;
  List<RecordedClasses> recordedClasses;
  String base_url;
  Body({this.featuredCategory,this.ongoingClasses, this.bestInstructors, this.recordedClasses, this.liveClasses, this.base_url});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['featured_category'] != null) {
      featuredCategory = new List<FeaturedCategory>();
      json['featured_category'].forEach((v) {
        featuredCategory.add(new FeaturedCategory.fromJson(v));
      });
    }
    if (json['ongoing_classes'] != null) {
      ongoingClasses = new List<OngoingClasses>();
      json['ongoing_classes'].forEach((v) {
        ongoingClasses.add(new OngoingClasses.fromJson(v));
      });
    }
    if (json['live_classes'] != null) {
      liveClasses = new List<LiveClasses>();
      json['live_classes'].forEach((v) {
        liveClasses.add(new LiveClasses.fromJson(v));
      });
    }
    if (json['best_instructors'] != null) {
      bestInstructors = new List<BestInstructors>();
      json['best_instructors'].forEach((v) {
        bestInstructors.add(new BestInstructors.fromJson(v));
      });
    }
    if (json['recorded_classes'] != null) {
      recordedClasses = new List<RecordedClasses>();
      json['recorded_classes'].forEach((v) {
        recordedClasses.add(new RecordedClasses.fromJson(v));
      });
    }
    base_url = json['base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.featuredCategory != null) {
      data['featured_category'] =
          this.featuredCategory.map((v) => v.toJson()).toList();
    }
    if (this.ongoingClasses != null) {
      data['ongoing_classes'] =
          this.ongoingClasses.map((v) => v.toJson()).toList();
    }
    if (this.liveClasses != null) {
      data['live_classes'] = this.liveClasses.map((v) => v.toJson()).toList();
    }
    if (this.bestInstructors != null) {
      data['best_instructors'] =
          this.bestInstructors.map((v) => v.toJson()).toList();
    }
    if (this.recordedClasses != null) {
      data['recorded_classes'] =
          this.recordedClasses.map((v) => v.toJson()).toList();
    }
    data['base_url'] = this.base_url;
    return data;
  }
}

class FeaturedCategory {
  String thumbnail;
  String name;

  FeaturedCategory({this.thumbnail, this.name});

  FeaturedCategory.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['name'] = this.name;
    return data;
  }
}

class LiveClasses {
  int id;
  dynamic userId;
  String streamId;
  String name;
  String description;
  String image;
  String status;
  String startsAt;

  LiveClasses(
      {this.id,
        this.userId,
        this.streamId,
        this.name,
        this.description,
        this.image,
        this.status,
        this.startsAt});

  LiveClasses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    streamId=json['stream_id'];
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
    data['stream_id'] = this.streamId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['starts_at'] = this.startsAt;
    return data;
  }
}
//@HiveType(typeId: 1)
class OngoingClasses {
  //@HiveField(0)
  String thumbnail;
 // @HiveField(1)
  String streamUrl;

  OngoingClasses({this.thumbnail, this.streamUrl});

  OngoingClasses.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    streamUrl = json['stream_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['stream_url'] = this.streamUrl;
    return data;
  }
}
//@HiveType(typeId: 2)
class BestInstructors {
  //@HiveField(0)
  String thumbnail;
  //@HiveField(1)
  String name;
 // @HiveField(2)
  String specialization;

  BestInstructors({this.thumbnail, this.name, this.specialization});

  BestInstructors.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    name = json['name'];
    specialization = json['specialization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['name'] = this.name;
    data['specialization'] = this.specialization;
    return data;
  }
}
//@HiveType(typeId: 3)
class RecordedClasses {
  //@HiveField(0)
  String thumbnail;
  //@HiveField(1)
  String name;
  //@HiveField(2)
  String specialization;
  String user_id;
  String description;
  String Url;
  String image;
  int id;

  RecordedClasses({this.thumbnail, this.name, this.specialization,this.user_id,this.description,this.Url,this.image,this.id});

  RecordedClasses.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    name = json['name'];
    specialization = json['specialization'];
    specialization = json['user_id'];
    description = json['description'];
    Url = json['url'];
    image = json['image'];
    id=json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['name'] = this.name;
    data['specialization'] = this.specialization;
    data['user_id'] = this.user_id;
    data['description'] = this.description;
    data['url'] = this.Url;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}