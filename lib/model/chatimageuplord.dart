/// body : {"source":"https://bvidya.websites4demo.com/messanger-attachment/MjxAolMcjSgxzgPXb4eWeh88e2kKfQA7TnhHUigY.jpeg"}
/// status : "successfull"
/// message : "The file field is required."

class Chatimageuplord {
  Chatimageuplord({
      Body body, 
      String status, 
      String message,}){
    _body = body;
    _status = status;
    _message = message;
}

  Chatimageuplord.fromJson(dynamic json) {
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
    _status = json['status'];
    _message = json['message'];
  }
  Body _body;
  String _status;
  String _message;

  Body get body => _body;
  String get status => _status;
  String get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_body != null) {
      map['body'] = _body.toJson();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}

/// source : "https://bvidya.websites4demo.com/messanger-attachment/MjxAolMcjSgxzgPXb4eWeh88e2kKfQA7TnhHUigY.jpeg"

class Body {
  Body({
      String source,}){
    _source = source;
}

  Body.fromJson(dynamic json) {
    _source = json['source'];
  }
  String _source;

  String get source => _source;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['source'] = _source;
    return map;
  }

}