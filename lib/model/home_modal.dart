/// body : {"featured_category":[{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/Chemistry.png","name":"Chemistry"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/Biology.png","name":"Biology"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/Physics.png","name":"Physics"}],"live_classes":[{"id":1,"user_id":"1","name":"Programing-101","description":"Fundamental of programing and its building blocks.","image":"live/KyPbqca0QPDLeAnVH5vqKTIqyhUxjjrYCR9Xghjt.jpeg","status":"streaming","starts_at":"2021-12-08 16:30:00"},{"id":2,"user_id":"1","name":"Applied Data Structure And  Its Use Cases","description":"Application of data structure. its algorithms and  common use cases.","image":"live/qN1vE2tWPUC8MsAQK0X5QCK5NihKObAIYnMU9fW1.jpeg","status":"scheduled","starts_at":"2021-12-08 05:30:00"}],"ongoing_classes":[{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/1.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/1.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/2.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/2.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/3.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/3.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/4.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/4.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/5.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/5.mp4"}],"best_instructors":[{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/ANKITA.png","name":"ANKITA","specialization":"Sociology"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/VIVEK.png","name":"VIVEK","specialization":"Geography"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/ARUN_JOSHI.png","name":"ARUN JOSHI","specialization":"Hindi"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/NIDHI.png","name":"NIDHI","specialization":"Physics"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/MANJEET.png","name":"MANJEET","specialization":"Mathematics"}],"recorded_classes":[{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/11.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/1.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/12.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/2.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/13.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/3.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/14.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/4.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/15.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/5.mp4"}]}
/// status : "successfull"

class HomeModal {
  HomeModal({
      Body body, 
      String status,}){
    _body = body;
    _status = status;
}

  HomeModal.fromJson(dynamic json) {
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
    _status = json['status'];
  }
  Body _body;
  String _status;

  Body get body => _body;
  String get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_body != null) {
      map['body'] = _body.toJson();
    }
    map['status'] = _status;
    return map;
  }

}

/// featured_category : [{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/Chemistry.png","name":"Chemistry"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/Biology.png","name":"Biology"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/Physics.png","name":"Physics"}]
/// live_classes : [{"id":1,"user_id":"1","name":"Programing-101","description":"Fundamental of programing and its building blocks.","image":"live/KyPbqca0QPDLeAnVH5vqKTIqyhUxjjrYCR9Xghjt.jpeg","status":"streaming","starts_at":"2021-12-08 16:30:00"},{"id":2,"user_id":"1","name":"Applied Data Structure And  Its Use Cases","description":"Application of data structure. its algorithms and  common use cases.","image":"live/qN1vE2tWPUC8MsAQK0X5QCK5NihKObAIYnMU9fW1.jpeg","status":"scheduled","starts_at":"2021-12-08 05:30:00"}]
/// ongoing_classes : [{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/1.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/1.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/2.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/2.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/3.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/3.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/4.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/4.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/5.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/5.mp4"}]
/// best_instructors : [{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/ANKITA.png","name":"ANKITA","specialization":"Sociology"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/VIVEK.png","name":"VIVEK","specialization":"Geography"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/ARUN_JOSHI.png","name":"ARUN JOSHI","specialization":"Hindi"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/NIDHI.png","name":"NIDHI","specialization":"Physics"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/MANJEET.png","name":"MANJEET","specialization":"Mathematics"}]
/// recorded_classes : [{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/11.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/1.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/12.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/2.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/13.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/3.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/14.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/4.mp4"},{"thumbnail":"https://bvidya.websites4demo.com/temporary/picture/15.jpg","stream_url":"https://bvidya.websites4demo.com/temporary/video/5.mp4"}]

class Body {
  Body({
      List<Featured_category> featuredCategory, 
      List<Live_classes> liveClasses, 
      List<Ongoing_classes> ongoingClasses, 
      List<Best_instructors> bestInstructors, 
      List<Recorded_classes> recordedClasses,}){
    _featuredCategory = featuredCategory;
    _liveClasses = liveClasses;
    _ongoingClasses = ongoingClasses;
    _bestInstructors = bestInstructors;
    _recordedClasses = recordedClasses;
}

  Body.fromJson(dynamic json) {
    if (json['featured_category'] != null) {
      _featuredCategory = [];
      json['featured_category'].forEach((v) {
        _featuredCategory.add(Featured_category.fromJson(v));
      });
    }
    if (json['live_classes'] != null) {
      _liveClasses = [];
      json['live_classes'].forEach((v) {
        _liveClasses.add(Live_classes.fromJson(v));
      });
    }
    if (json['ongoing_classes'] != null) {
      _ongoingClasses = [];
      json['ongoing_classes'].forEach((v) {
        _ongoingClasses.add(Ongoing_classes.fromJson(v));
      });
    }
    if (json['best_instructors'] != null) {
      _bestInstructors = [];
      json['best_instructors'].forEach((v) {
        _bestInstructors.add(Best_instructors.fromJson(v));
      });
    }
    if (json['recorded_classes'] != null) {
      _recordedClasses = [];
      json['recorded_classes'].forEach((v) {
        _recordedClasses.add(Recorded_classes.fromJson(v));
      });
    }
  }
  List<Featured_category> _featuredCategory;
  List<Live_classes> _liveClasses;
  List<Ongoing_classes> _ongoingClasses;
  List<Best_instructors> _bestInstructors;
  List<Recorded_classes> _recordedClasses;

  List<Featured_category> get featuredCategory => _featuredCategory;
  List<Live_classes> get liveClasses => _liveClasses;
  List<Ongoing_classes> get ongoingClasses => _ongoingClasses;
  List<Best_instructors> get bestInstructors => _bestInstructors;
  List<Recorded_classes> get recordedClasses => _recordedClasses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_featuredCategory != null) {
      map['featured_category'] = _featuredCategory.map((v) => v.toJson()).toList();
    }
    if (_liveClasses != null) {
      map['live_classes'] = _liveClasses.map((v) => v.toJson()).toList();
    }
    if (_ongoingClasses != null) {
      map['ongoing_classes'] = _ongoingClasses.map((v) => v.toJson()).toList();
    }
    if (_bestInstructors != null) {
      map['best_instructors'] = _bestInstructors.map((v) => v.toJson()).toList();
    }
    if (_recordedClasses != null) {
      map['recorded_classes'] = _recordedClasses.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// thumbnail : "https://bvidya.websites4demo.com/temporary/picture/11.jpg"
/// stream_url : "https://bvidya.websites4demo.com/temporary/video/1.mp4"

class Recorded_classes {
  Recorded_classes({
      String thumbnail, 
      String streamUrl,}){
    _thumbnail = thumbnail;
    _streamUrl = streamUrl;
}

  Recorded_classes.fromJson(dynamic json) {
    _thumbnail = json['thumbnail'];
    _streamUrl = json['stream_url'];
  }
  String _thumbnail;
  String _streamUrl;

  String get thumbnail => _thumbnail;
  String get streamUrl => _streamUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumbnail'] = _thumbnail;
    map['stream_url'] = _streamUrl;
    return map;
  }

}

/// thumbnail : "https://bvidya.websites4demo.com/temporary/picture/ANKITA.png"
/// name : "ANKITA"
/// specialization : "Sociology"

class Best_instructors {
  Best_instructors({
      String thumbnail, 
      String name, 
      String specialization,}){
    _thumbnail = thumbnail;
    _name = name;
    _specialization = specialization;
}

  Best_instructors.fromJson(dynamic json) {
    _thumbnail = json['thumbnail'];
    _name = json['name'];
    _specialization = json['specialization'];
  }
  String _thumbnail;
  String _name;
  String _specialization;

  String get thumbnail => _thumbnail;
  String get name => _name;
  String get specialization => _specialization;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumbnail'] = _thumbnail;
    map['name'] = _name;
    map['specialization'] = _specialization;
    return map;
  }

}

/// thumbnail : "https://bvidya.websites4demo.com/temporary/picture/1.jpg"
/// stream_url : "https://bvidya.websites4demo.com/temporary/video/1.mp4"

class Ongoing_classes {
  Ongoing_classes({
      String thumbnail, 
      String streamUrl,}){
    _thumbnail = thumbnail;
    _streamUrl = streamUrl;
}

  Ongoing_classes.fromJson(dynamic json) {
    _thumbnail = json['thumbnail'];
    _streamUrl = json['stream_url'];
  }
  String _thumbnail;
  String _streamUrl;

  String get thumbnail => _thumbnail;
  String get streamUrl => _streamUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumbnail'] = _thumbnail;
    map['stream_url'] = _streamUrl;
    return map;
  }

}

/// id : 1
/// user_id : "1"
/// name : "Programing-101"
/// description : "Fundamental of programing and its building blocks."
/// image : "live/KyPbqca0QPDLeAnVH5vqKTIqyhUxjjrYCR9Xghjt.jpeg"
/// status : "streaming"
/// starts_at : "2021-12-08 16:30:00"

class Live_classes {
  Live_classes({
      int id, 
      String userId, 
      String name, 
      String description, 
      String image, 
      String status, 
      String startsAt,}){
    _id = id;
    _userId = userId;
    _name = name;
    _description = description;
    _image = image;
    _status = status;
    _startsAt = startsAt;
}

  Live_classes.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _status = json['status'];
    _startsAt = json['starts_at'];
  }
  int _id;
  String _userId;
  String _name;
  String _description;
  String _image;
  String _status;
  String _startsAt;

  int get id => _id;
  String get userId => _userId;
  String get name => _name;
  String get description => _description;
  String get image => _image;
  String get status => _status;
  String get startsAt => _startsAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    map['status'] = _status;
    map['starts_at'] = _startsAt;
    return map;
  }

}

/// thumbnail : "https://bvidya.websites4demo.com/temporary/picture/Chemistry.png"
/// name : "Chemistry"

class Featured_category {
  Featured_category({
      String thumbnail, 
      String name,}){
    _thumbnail = thumbnail;
    _name = name;
}

  Featured_category.fromJson(dynamic json) {
    _thumbnail = json['thumbnail'];
    _name = json['name'];
  }
  String _thumbnail;
  String _name;

  String get thumbnail => _thumbnail;
  String get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumbnail'] = _thumbnail;
    map['name'] = _name;
    return map;
  }

}