class InstructorProfileModal {
  Body body;
  String status;

  InstructorProfileModal({this.body, this.status});

  InstructorProfileModal.fromJson(Map<String, dynamic> json) {
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
  Profile profile;
  List<Followers> followers;
  List<Watchtime> watchtime;
  List<Courses> courses;
  List<Meetings> meetings;
  List<Webinar> webinar;
  List<Liked> liked;

  Body(
      {this.profile,
        this.followers,
        this.watchtime,
        this.courses,
        this.meetings,
        this.webinar,
        this.liked});

  Body.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers.add(new Followers.fromJson(v));
      });
    }
    if (json['watchtime'] != null) {
      watchtime = <Watchtime>[];
      json['watchtime'].forEach((v) {
        watchtime.add(new Watchtime.fromJson(v));
      });
    }
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses.add(new Courses.fromJson(v));
      });
    }
    if (json['meetings'] != null) {
      meetings = <Meetings>[];
      json['meetings'].forEach((v) {
        meetings.add(new Meetings.fromJson(v));
      });
    }
    if (json['webinar'] != null) {
      webinar = <Webinar>[];
      json['webinar'].forEach((v) {
        webinar.add(new Webinar.fromJson(v));
      });
    }
    if (json['liked'] != null) {
      liked = <Liked>[];
      json['liked'].forEach((v) {
        liked.add(new Liked.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.followers != null) {
      data['followers'] = this.followers.map((v) => v.toJson()).toList();
    }
    if (this.watchtime != null) {
      data['watchtime'] = this.watchtime.map((v) => v.toJson()).toList();
    }
    if (this.courses != null) {
      data['courses'] = this.courses.map((v) => v.toJson()).toList();
    }
    if (this.meetings != null) {
      data['meetings'] = this.meetings.map((v) => v.toJson()).toList();
    }
    if (this.webinar != null) {
      data['webinar'] = this.webinar.map((v) => v.toJson()).toList();
    }
    if (this.liked != null) {
      data['liked'] = this.liked.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  String name;
  String phone;
  String email;
  String gender;
  dynamic age;
  String language;
  String bio;
  String occupation;
  dynamic experience;
  String specialization;
  String city;
  String state;
  String country;
  String address;
  String image;
  String twitterUrl;
  String facebookUrl;
  String instagramUrl;
  String youtubeUrl;
  String websiteUrl;

  Profile(
      {this.name,
        this.phone,
        this.email,
        this.gender,
        this.age,
        this.language,
        this.bio,
        this.occupation,
        this.experience,
        this.specialization,
        this.city,
        this.state,
        this.country,
        this.address,
        this.image,
        this.twitterUrl,
        this.facebookUrl,
        this.instagramUrl,
        this.youtubeUrl,
        this.websiteUrl});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    age = json['age'];
    language = json['language'];
    bio = json['bio'];
    occupation = json['occupation'];
    experience = json['experience'];
    specialization = json['specialization'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    address = json['address'];
    image = json['image'];
    twitterUrl = json['twitter_url'];
    facebookUrl = json['facebook_url'];
    instagramUrl = json['instagram_url'];
    youtubeUrl = json['youtube_url'];
    websiteUrl = json['website_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['language'] = this.language;
    data['bio'] = this.bio;
    data['occupation'] = this.occupation;
    data['experience'] = this.experience;
    data['specialization'] = this.specialization;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['address'] = this.address;
    data['image'] = this.image;
    data['twitter_url'] = this.twitterUrl;
    data['facebook_url'] = this.facebookUrl;
    data['instagram_url'] = this.instagramUrl;
    data['youtube_url'] = this.youtubeUrl;
    data['website_url'] = this.websiteUrl;
    return data;
  }
}

class Followers {
  dynamic count;

  Followers({this.count});

  Followers.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}

class Watchtime {
  dynamic total;

  Watchtime({this.total});

  Watchtime.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
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
  dynamic rating;
  dynamic ratingCount;
  dynamic views;
  String status;
  String createdAt;
  String updatedAt;

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
        this.rating,
        this.ratingCount,
        this.views,
        this.status,
        this.createdAt,
        this.updatedAt});

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

class Meetings {
  dynamic id;
  dynamic userId;
  dynamic meetingId;
  String name;
  String description;
  String status;
  String streamChannel;
  String streamToken;
  String startsAt;
  String endsAt;
  String repeats;
  String disableVideo;
  String disableAudio;
  String createdAt;
  String updatedAt;

  Meetings(
      {this.id,
        this.userId,
        this.meetingId,
        this.name,
        this.description,
        this.status,
        this.streamChannel,
        this.streamToken,
        this.startsAt,
        this.endsAt,
        this.repeats,
        this.disableVideo,
        this.disableAudio,
        this.createdAt,
        this.updatedAt});

  Meetings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    meetingId = json['meeting_id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    streamChannel = json['stream_channel'];
    streamToken = json['stream_token'];
    startsAt = json['starts_at'];
    endsAt = json['ends_at'];
    repeats = json['repeats'];
    disableVideo = json['disable_video'];
    disableAudio = json['disable_audio'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['meeting_id'] = this.meetingId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['status'] = this.status;
    data['stream_channel'] = this.streamChannel;
    data['stream_token'] = this.streamToken;
    data['starts_at'] = this.startsAt;
    data['ends_at'] = this.endsAt;
    data['repeats'] = this.repeats;
    data['disable_video'] = this.disableVideo;
    data['disable_audio'] = this.disableAudio;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Webinar {
  dynamic id;
  String name;
  String description;
  String image;
  String status;
  String startsAt;
  String endsAt;

  Webinar(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.status,
        this.startsAt,
        this.endsAt});

  Webinar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    startsAt = json['starts_at'];
    endsAt = json['ends_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['starts_at'] = this.startsAt;
    data['ends_at'] = this.endsAt;
    return data;
  }
}

class Liked {
  dynamic id;
  String name;
  dynamic courseId;
  dynamic userId;
  String description;
  String image;
  String videoId;
  String duration;
  String createdAt;
  String updatedAt;
  dynamic rating;
  String ratingCount;
  String videoTitle;
  String videoPath;

  Liked(
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
        this.rating,
        this.ratingCount,
        this.videoTitle,
        this.videoPath});

  Liked.fromJson(Map<String, dynamic> json) {
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
    rating = json['rating'];
    ratingCount = json['rating_count'];
    videoTitle = json['video_title'];
    videoPath = json['video_path'];
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
    data['rating'] = this.rating;
    data['rating_count'] = this.ratingCount;
    data['video_title'] = this.videoTitle;
    data['video_path'] = this.videoPath;
    return data;
  }
}