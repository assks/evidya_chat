class InstructorDetailsModal {
  Body body;
  String status;

  InstructorDetailsModal({this.body, this.status});

  InstructorDetailsModal.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null?  new Body.fromJson(json['body']) : null;
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
  String name;
  String phone;
  String email;
  String gender;
  String age;
  String language;
  String bio;
  String occupation;
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
  String experience;
  String specialization;

  Body(
      {this.name,
        this.phone,
        this.email,
        this.gender,
        this.age,
        this.language,
        this.bio,
        this.occupation,
        this.address,
        this.city,
        this.state,
        this.country,
        this.image,
        this.twitterUrl,
        this.facebookUrl,
        this.instagramUrl,
        this.youtubeUrl,
        this.experience,
        this.specialization,
        this.websiteUrl});

  Body.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    age = json['age'];
    language = json['language'];
    bio = json['bio'];
    occupation = json['occupation'];
    city = json['city'];
    address = json['address'];
    state = json['state'];
    country = json['country'];
    image = json['image'];
    twitterUrl = json['twitter_url'];
    facebookUrl = json['facebook_url'];
    instagramUrl = json['instagram_url'];
    youtubeUrl = json['youtube_url'];
    websiteUrl = json['website_url'];
    experience = json['experience'];
    specialization = json['specialization'];
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
    data['image'] = this.image;
    data['twitter_url'] = this.twitterUrl;
    data['facebook_url'] = this.facebookUrl;
    data['instagram_url'] = this.instagramUrl;
    data['youtube_url'] = this.youtubeUrl;
    data['website_url'] = this.websiteUrl;
    data['specialization'] = this.specialization;
    data['experience'] = this.experience;
    return data;
  }
}