/// body : {"courses":[{"id":1,"name":"Programing In PHP","category_id":"1","user_id":"1","description":"PHP is a general-purpose scripting language geared towards web development. It was originally created by Danish-Canadian programmer Rasmus Lerdorf in 1994. The PHP reference implementation is now produced by The PHP Group.","image":"courses/Cln0dt6MlUSZzeeinPiD7OTIOi5M6qSJCo1tqvwj.jpeg","slug":"programing-in-php","created_at":"2021-10-31T23:57:40.000000Z","updated_at":"2021-11-18T01:29:54.000000Z"},{"id":2,"name":"Java Script 101","category_id":"1","user_id":"1","description":"JavaScript is the world's most popular programming language. JavaScript is the programming language of the Web. JavaScript is easy to learn.","image":"courses/DOy5Xj9DDli2cpfeh4NEqtn4FQ8jDdmBdD1doKND.jpeg","slug":"java-script-101","created_at":"2021-11-10T02:33:33.000000Z","updated_at":"2021-11-17T03:06:08.000000Z"},{"id":5,"name":"Search Engine Optimization","category_id":"1","user_id":"3","description":"A complete course for mastering the SEO tools and technics","image":"courses/Z10AVOBbj5jQbCYW3Sb4NtABxAy8NwQes5EoL5XS.jpeg","slug":"search-engine-optimization","created_at":"2021-12-16T02:30:13.000000Z","updated_at":"2021-12-16T03:50:08.000000Z"}]}
/// status : "successfull"

class CourseModal {
  CourseModal({
      Body body,
      String status,}){
    _body = body;
    _status = status;
}

  CourseModal.fromJson(dynamic json) {
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
      map['body'] = _body?.toJson();
    }
    map['status'] = _status;
    return map;
  }

}

/// courses : [{"id":1,"name":"Programing In PHP","category_id":"1","user_id":"1","description":"PHP is a general-purpose scripting language geared towards web development. It was originally created by Danish-Canadian programmer Rasmus Lerdorf in 1994. The PHP reference implementation is now produced by The PHP Group.","image":"courses/Cln0dt6MlUSZzeeinPiD7OTIOi5M6qSJCo1tqvwj.jpeg","slug":"programing-in-php","created_at":"2021-10-31T23:57:40.000000Z","updated_at":"2021-11-18T01:29:54.000000Z"},{"id":2,"name":"Java Script 101","category_id":"1","user_id":"1","description":"JavaScript is the world's most popular programming language. JavaScript is the programming language of the Web. JavaScript is easy to learn.","image":"courses/DOy5Xj9DDli2cpfeh4NEqtn4FQ8jDdmBdD1doKND.jpeg","slug":"java-script-101","created_at":"2021-11-10T02:33:33.000000Z","updated_at":"2021-11-17T03:06:08.000000Z"},{"id":5,"name":"Search Engine Optimization","category_id":"1","user_id":"3","description":"A complete course for mastering the SEO tools and technics","image":"courses/Z10AVOBbj5jQbCYW3Sb4NtABxAy8NwQes5EoL5XS.jpeg","slug":"search-engine-optimization","created_at":"2021-12-16T02:30:13.000000Z","updated_at":"2021-12-16T03:50:08.000000Z"}]

class Body {
  Body({
      List<Courses> courses,}){
    _courses = courses;
}

  Body.fromJson(dynamic json) {
    if (json['courses'] != null) {
      _courses = [];
      json['courses'].forEach((v) {
        _courses?.add(Courses.fromJson(v));
      });
    }
    if (json['lessons'] != null) {
      _courses = [];
      json['lessons'].forEach((v) {
        _courses?.add(Courses.fromJson(v));
      });
    }
  }
  List<Courses> _courses;

  List<Courses> get courses => _courses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_courses != null) {
      map['courses'] = _courses?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Programing In PHP"
/// category_id : "1"
/// user_id : "1"
/// description : "PHP is a general-purpose scripting language geared towards web development. It was originally created by Danish-Canadian programmer Rasmus Lerdorf in 1994. The PHP reference implementation is now produced by The PHP Group."
/// image : "courses/Cln0dt6MlUSZzeeinPiD7OTIOi5M6qSJCo1tqvwj.jpeg"
/// slug : "programing-in-php"
/// created_at : "2021-10-31T23:57:40.000000Z"
/// updated_at : "2021-11-18T01:29:54.000000Z"

class Courses {
  Courses({
      int id,
      String name,
      String categoryId,
      String userId,
      String description,
      String image,
      String slug,
      String createdAt,
      String updatedAt,}){
    _id = id;
    _name = name;
    _categoryId = categoryId;
    _userId = userId;
    _description = description;
    _image = image;
    _slug = slug;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Courses.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _categoryId = json['category_id'];
    _userId = json['user_id'];
    _description = json['description'];
    _image = json['image'];
    _slug = json['slug'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int _id;
  String _name;
  String _categoryId;
  String _userId;
  String _description;
  String _image;
  String _slug;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  String get name => _name;
  String get categoryId => _categoryId;
  String get userId => _userId;
  String get description => _description;
  String get image => _image;
  String get slug => _slug;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['category_id'] = _categoryId;
    map['user_id'] = _userId;
    map['description'] = _description;
    map['image'] = _image;
    map['slug'] = _slug;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}