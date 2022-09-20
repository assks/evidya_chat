/// responseMessage : {"reasonPhrase":"E - Card payment is added successfully.","statusCode":200,"isSuccessStatusCode":true}
/// data : {"id":5}

class EcardSubmitModel {
  ResponseMessage _responseMessage;
  Data _data;

  ResponseMessage get responseMessage => _responseMessage;
  Data get data => _data;

  EcardSubmitModel({
      ResponseMessage responseMessage, 
      Data data}){
    _responseMessage = responseMessage;
    _data = data;
}

  EcardSubmitModel.fromJson(dynamic json) {
    _responseMessage = json["responseMessage"] != null ? ResponseMessage.fromJson(json["responseMessage"]) : null;
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_responseMessage != null) {
      map["responseMessage"] = _responseMessage.toJson();
    }
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

/// id : 5

class Data {
  int _id;

  int get id => _id;

  Data({
      int id}){
    _id = id;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    return map;
  }

}

/// reasonPhrase : "E - Card payment is added successfully."
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