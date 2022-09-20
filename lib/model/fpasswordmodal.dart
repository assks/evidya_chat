/// body : []
/// status : "successfull"

class Fpasswordmodal {
  Fpasswordmodal({
    List<dynamic> body,
    String status,
    String message,
  }) {
    _body = body;
    _status = status;
    _message = message;
  }

  Fpasswordmodal.fromJson(dynamic json) {
    if (json['body'] != null) {
      _body = [];
      json['body'].forEach((v) {
        _body?.add(json.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
  }

  List<dynamic> _body;
  String _status;
  String _message;

  List<dynamic> get body => _body;

  String get status => _status;

  String get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_body != null) {
      map['body'] = _body?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}
