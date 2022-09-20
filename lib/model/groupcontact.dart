/// body : {"users":[{"id":1,"name":"KUNAL PANDEY","phone":"9149252803"},{"id":3,"name":"KUNAL PANDEY","phone":"9149252803"},{"id":7,"name":"ANIKET KUMAR","phone":"9868066089"},{"id":12,"name":"Heenu","phone":"8285487769"},{"id":14,"name":"Piyush kanwal","phone":"8791381896"},{"id":16,"name":"Prashant","phone":"9650100020"},{"id":19,"name":"Vishal Yadav","phone":"9560023760"},{"id":24,"name":"Shubham Pandey","phone":"7060873196"},{"id":29,"name":"Rahul Singh","phone":"9876543210"},{"id":30,"name":"Divya Pandey","phone":"9990686579"},{"id":31,"name":"Arunendra","phone":"9759144699"},{"id":32,"name":"rahul singh","phone":"7060305010"},{"id":35,"name":"shushant kumar","phone":"9654352768"},{"id":37,"name":"Anjali","phone":"8130502553"},{"id":39,"name":"Ashish","phone":"5456464949"},{"id":49,"name":"aunty","phone":"9540106020"},{"id":50,"name":"Satyam","phone":"8272919494"},{"id":51,"name":"animesh","phone":"9540100000"},{"id":52,"name":"animesh","phone":"9540100011"},{"id":53,"name":"anik study","phone":"9540100300"},{"id":55,"name":"Gaurav","phone":"9128793361"},{"id":56,"name":"Kundan","phone":"8754664945"},{"id":57,"name":"TestTeam","phone":"9876543210"},{"id":58,"name":"Test Tesm","phone":"9876543210"},{"id":59,"name":"bVidya New Register","phone":"9876543210"},{"id":60,"name":"Atif aslam","phone":"5464691979"},{"id":62,"name":"Nitish Kumar Jha","phone":"9871802671"},{"id":63,"name":"Ankna","phone":"9876543210"},{"id":66,"name":"Kunal Singh","phone":"9312608490"},{"id":67,"name":"Ankna","phone":"9766494944"},{"id":68,"name":"Aman Bhatia","phone":"7854994664"},{"id":70,"name":"Sunny","phone":"8527780640"},{"id":71,"name":"Aniket","phone":"9868066089"},{"id":73,"name":"Kanchan Bhatt","phone":"8287864793"},{"id":75,"name":"Arun Joshi","phone":"9719748633"},{"id":77,"name":"sushil singh","phone":"9935955552"},{"id":79,"name":"Ashish","phone":"8299289497"},{"id":83,"name":"Yashika","phone":"8860136340"},{"id":84,"name":"Shahzaib","phone":"3336906353"},{"id":85,"name":"khan G","phone":"3345713838"},{"id":86,"name":"summydeol","phone":"9540171477"},{"id":87,"name":"Rana shehroz","phone":"1234564890"}]}
/// status : "successfull"

class Groupcontact {
  Groupcontact({
      Body body, 
      String status,}){
    _body = body;
    _status = status;
}

  Groupcontact.fromJson(dynamic json) {
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
    _status = json['status'];
  }
  Body _body;
  String _status;
Groupcontact copyWith({  Body body,
  String status,
}) => Groupcontact(  body: body ?? _body,
  status: status ?? _status,
);
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

/// users : [{"id":1,"name":"KUNAL PANDEY","phone":"9149252803"},{"id":3,"name":"KUNAL PANDEY","phone":"9149252803"},{"id":7,"name":"ANIKET KUMAR","phone":"9868066089"},{"id":12,"name":"Heenu","phone":"8285487769"},{"id":14,"name":"Piyush kanwal","phone":"8791381896"},{"id":16,"name":"Prashant","phone":"9650100020"},{"id":19,"name":"Vishal Yadav","phone":"9560023760"},{"id":24,"name":"Shubham Pandey","phone":"7060873196"},{"id":29,"name":"Rahul Singh","phone":"9876543210"},{"id":30,"name":"Divya Pandey","phone":"9990686579"},{"id":31,"name":"Arunendra","phone":"9759144699"},{"id":32,"name":"rahul singh","phone":"7060305010"},{"id":35,"name":"shushant kumar","phone":"9654352768"},{"id":37,"name":"Anjali","phone":"8130502553"},{"id":39,"name":"Ashish","phone":"5456464949"},{"id":49,"name":"aunty","phone":"9540106020"},{"id":50,"name":"Satyam","phone":"8272919494"},{"id":51,"name":"animesh","phone":"9540100000"},{"id":52,"name":"animesh","phone":"9540100011"},{"id":53,"name":"anik study","phone":"9540100300"},{"id":55,"name":"Gaurav","phone":"9128793361"},{"id":56,"name":"Kundan","phone":"8754664945"},{"id":57,"name":"TestTeam","phone":"9876543210"},{"id":58,"name":"Test Tesm","phone":"9876543210"},{"id":59,"name":"bVidya New Register","phone":"9876543210"},{"id":60,"name":"Atif aslam","phone":"5464691979"},{"id":62,"name":"Nitish Kumar Jha","phone":"9871802671"},{"id":63,"name":"Ankna","phone":"9876543210"},{"id":66,"name":"Kunal Singh","phone":"9312608490"},{"id":67,"name":"Ankna","phone":"9766494944"},{"id":68,"name":"Aman Bhatia","phone":"7854994664"},{"id":70,"name":"Sunny","phone":"8527780640"},{"id":71,"name":"Aniket","phone":"9868066089"},{"id":73,"name":"Kanchan Bhatt","phone":"8287864793"},{"id":75,"name":"Arun Joshi","phone":"9719748633"},{"id":77,"name":"sushil singh","phone":"9935955552"},{"id":79,"name":"Ashish","phone":"8299289497"},{"id":83,"name":"Yashika","phone":"8860136340"},{"id":84,"name":"Shahzaib","phone":"3336906353"},{"id":85,"name":"khan G","phone":"3345713838"},{"id":86,"name":"summydeol","phone":"9540171477"},{"id":87,"name":"Rana shehroz","phone":"1234564890"}]

class Body {
  Body({
      List<Users> users,}){
    _users = users;
}

  Body.fromJson(dynamic json) {
    if (json['users'] != null) {
      _users = [];
      json['users'].forEach((v) {
        _users.add(Users.fromJson(v));
      });
    }
  }
  List<Users> _users;
Body copyWith({  List<Users> users,
}) => Body(  users: users ?? _users,
);
  List<Users> get users => _users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_users != null) {
      map['users'] = _users.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "KUNAL PANDEY"
/// phone : "9149252803"

class Users {
  Users({
      int id, 
      String name, 
      String phone,
      String email,
      String profile_image}){
    _id = id;
    _name = name;
    _phone = phone;
    _email =email;
    _profile_image = profile_image;

}

  Users.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _email =json['email'];
    _profile_image=json['profile_image'];
  }
  int _id;
  String _name;
  String _phone;
  String _email;
  String _profile_image;
Users copyWith({  int id,
  String name,
  String phone,
  String email,
  String profile_image,
}) => Users(  id: id ?? _id,
  name: name ?? _name,
  phone: phone ?? _phone,
  email:email ?? _email,
    profile_image:profile_image ?? _profile_image,
);
  int get id => _id;
  String get name => _name;
  String get phone => _phone;
  String get email => _email;
  String get profile_image => _profile_image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['profile_image'] = _profile_image;
    return map;
  }

}