
class LoginModel {
  ResponseMessage _responseMessage;
  LoginData _data;

  ResponseMessage get responseMessage => _responseMessage;
  LoginData get data => _data;

  LoginModel({
    ResponseMessage responseMessage,
    LoginData data}){
    _responseMessage = responseMessage;
    _data = data;
  }

  LoginModel.fromJson(dynamic json) {
    _responseMessage = json["responseMessage"] != null ? ResponseMessage.fromJson(json["responseMessage"]) : null;
    _data = json["data"] != null ? LoginData.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_responseMessage != null) {
      map["responseMessage"] = _responseMessage?.toJson();
    }
    if (_data != null) {
      map["data"] = _data?.toJson();
    }
    return map;
  }

}

/// id : "cf35ca9c-35dc-453c-85e5-b70161ec72c4"
/// firstName : null
/// lastName : null
/// role : "Admin"
/// bearerToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluQEdpZnRDb2NrdGFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJuYmYiOjE2MjY4NDY4NjgsImV4cCI6MTYyNzQ1MTY2OCwiaWF0IjoxNjI2ODQ2ODY4fQ.hcNHcysIA1UAssn-30yvJawo9ah1YHy1ZvFjyNFdvoc"

class LoginData {
  String _id;
  dynamic _firstName;
  dynamic _lastName;
  dynamic _usermail;
  dynamic _userimage;
  String _role;
  String _bearerToken;

  String get id => _id;
  dynamic get firstName => _firstName;
  dynamic get lastName => _lastName;
  dynamic get usermail => _usermail;
  dynamic get userimage => _userimage;

  String get role => _role;
  String get bearerToken => _bearerToken;

  Data({
    String id,
    dynamic firstName,
    dynamic lastName,
    dynamic usermail,
    dynamic userimage,
    String role,
    String bearerToken}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _usermail = usermail;
    _userimage = userimage;
    _role = role;
    _bearerToken = bearerToken;
  }

  LoginData.fromJson(dynamic json) {
    _id = json["id"];
    _firstName = json["firstName"];
    _lastName = json["lastName"];
    _userimage = json["profilePic"];
    _usermail = json["email"];
    _role = json["role"];
    _bearerToken = json["bearerToken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["profilePic"] = _userimage;
    map["email"] = _usermail;
    map["role"] = _role;
    map["bearerToken"] = _bearerToken;
    return map;
  }

}

/// reasonPhrase : "You are logged in successfully."
/// statusCode : 200
/// isSuccessStatusCode : true

class ResponseMessage {
  String _reasonPhrase;
  int _statusCode;
  bool _isSuccessStatusCode;

  String get reasonPhrase => _reasonPhrase;
  int get statusCode => _statusCode;
  bool get isSuccessStatusCode => _isSuccessStatusCode;

  ResponseMessage({
    String reasonPhrase,
    int statusCode,
    bool isSuccessStatusCode}){
    _reasonPhrase = reasonPhrase;
    _statusCode = statusCode;
    _isSuccessStatusCode = isSuccessStatusCode;
  }

  ResponseMessage.fromJson(dynamic json) {
    _reasonPhrase = json["reasonPhrase"];
    _statusCode = json["statusCode"];
    _isSuccessStatusCode = json["isSuccessStatusCode"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["reasonPhrase"] = _reasonPhrase;
    map["statusCode"] = _statusCode;
    map["isSuccessStatusCode"] = _isSuccessStatusCode;
    return map;
  }

}