class PrefranceData {
  String authToken;
  String name;
  String email;
  String phone;
  String role;
  int id;

  PrefranceData({this.authToken, this.name, this.email, this.phone, this.role,this.id});

  PrefranceData.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_token'] = this.authToken;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['id'] = this.id;
    return data;
  }
}