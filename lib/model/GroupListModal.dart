/// body : {"groups":[{"id":6,"group_name":"Education Board","group_admin":"KUNAL PANDEY","description":"A Discussion Place For Education Board Members","image":"group/preview.png","members":[{"pid":"4294967302","name":"ANIKET KUMAR","fcm_token":null,"profile_image":"users/tXel3OSGArzkWauD8veqCpd93bplmOpRA0gUbQkj.jpeg"},{"pid":"4294967297","name":"ARUN JOSHI","fcm_token":null,"profile_image":"users/default.png"},{"pid":"4294967296","name":"KUNAL PANDEY","fcm_token":null,"profile_image":"users/4Ecykb8PpKWuctfgHaMuafwe0m4WxeAgsSmFvzdU.jpeg"}],"self":{"pid":"4294967296","name":"KUNAL PANDEY"}},{"id":7,"group_name":"Product Support","group_admin":"KUNAL PANDEY","description":"A Discussion Place For Bvidya Product Support","image":"group/preview.png","members":[{"pid":"4294967302","name":"ANIKET KUMAR","fcm_token":null,"profile_image":"users/tXel3OSGArzkWauD8veqCpd93bplmOpRA0gUbQkj.jpeg"},{"pid":"4294967297","name":"ARUN JOSHI","fcm_token":null,"profile_image":"users/default.png"},{"pid":"4294967306","name":"ABHINAV TRIPATHI","fcm_token":null,"profile_image":"users/default.png"},{"pid":"4294967296","name":"KUNAL PANDEY","fcm_token":null,"profile_image":"users/4Ecykb8PpKWuctfgHaMuafwe0m4WxeAgsSmFvzdU.jpeg"}],"self":{"pid":"4294967296","name":"KUNAL PANDEY"}}]}
/// status : "successfull"

class GroupListModal {
  GroupListModal({
      Body body, 
      String status,}){
    _body = body;
    _status = status;
}

  GroupListModal.fromJson(dynamic json) {
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
    _status = json['status'];
  }
  Body _body;
  String _status;
GroupListModal copyWith({  Body body,
  String status,
}) => GroupListModal(  body: body ?? _body,
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

/// groups : [{"id":6,"group_name":"Education Board","group_admin":"KUNAL PANDEY","description":"A Discussion Place For Education Board Members","image":"group/preview.png","members":[{"pid":"4294967302","name":"ANIKET KUMAR","fcm_token":null,"profile_image":"users/tXel3OSGArzkWauD8veqCpd93bplmOpRA0gUbQkj.jpeg"},{"pid":"4294967297","name":"ARUN JOSHI","fcm_token":null,"profile_image":"users/default.png"},{"pid":"4294967296","name":"KUNAL PANDEY","fcm_token":null,"profile_image":"users/4Ecykb8PpKWuctfgHaMuafwe0m4WxeAgsSmFvzdU.jpeg"}],"self":{"pid":"4294967296","name":"KUNAL PANDEY"}},{"id":7,"group_name":"Product Support","group_admin":"KUNAL PANDEY","description":"A Discussion Place For Bvidya Product Support","image":"group/preview.png","members":[{"pid":"4294967302","name":"ANIKET KUMAR","fcm_token":null,"profile_image":"users/tXel3OSGArzkWauD8veqCpd93bplmOpRA0gUbQkj.jpeg"},{"pid":"4294967297","name":"ARUN JOSHI","fcm_token":null,"profile_image":"users/default.png"},{"pid":"4294967306","name":"ABHINAV TRIPATHI","fcm_token":null,"profile_image":"users/default.png"},{"pid":"4294967296","name":"KUNAL PANDEY","fcm_token":null,"profile_image":"users/4Ecykb8PpKWuctfgHaMuafwe0m4WxeAgsSmFvzdU.jpeg"}],"self":{"pid":"4294967296","name":"KUNAL PANDEY"}}]

class Body {
  Body({
      List<Groups> groups,}){
    _groups = groups;
}

  Body.fromJson(dynamic json) {
    if (json['groups'] != null) {
      _groups = [];
      json['groups'].forEach((v) {
        _groups.add(Groups.fromJson(v));
      });
    }
  }
  List<Groups> _groups;
Body copyWith({  List<Groups> groups,
}) => Body(  groups: groups ?? _groups,
);
  List<Groups> get groups => _groups;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_groups != null) {
      map['groups'] = _groups.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 6
/// group_name : "Education Board"
/// group_admin : "KUNAL PANDEY"
/// description : "A Discussion Place For Education Board Members"
/// image : "group/preview.png"
/// members : [{"pid":"4294967302","name":"ANIKET KUMAR","fcm_token":null,"profile_image":"users/tXel3OSGArzkWauD8veqCpd93bplmOpRA0gUbQkj.jpeg"},{"pid":"4294967297","name":"ARUN JOSHI","fcm_token":null,"profile_image":"users/default.png"},{"pid":"4294967296","name":"KUNAL PANDEY","fcm_token":null,"profile_image":"users/4Ecykb8PpKWuctfgHaMuafwe0m4WxeAgsSmFvzdU.jpeg"}]
/// self : {"pid":"4294967296","name":"KUNAL PANDEY"}

class Groups {
  Groups({
      int id, 
      String groupName, 
      String groupAdmin, 
      String description, 
      String image, 
      List<Members> members, 
      Self self,}){
    _id = id;
    _groupName = groupName;
    _groupAdmin = groupAdmin;
    _description = description;
    _image = image;
    _members = members;
    _self = self;
}

  Groups.fromJson(dynamic json) {
    _id = json['id'];
    _groupName = json['group_name'];
    _groupAdmin = json['group_admin'];
    _description = json['description'];
    _image = json['image'];
    if (json['members'] != null) {
      _members = [];
      json['members'].forEach((v) {
        _members.add(Members.fromJson(v));
      });
    }
    _self = json['self'] != null ? Self.fromJson(json['self']) : null;
  }
  int _id;
  String _groupName;
  String _groupAdmin;
  String _description;
  String _image;
  List<Members> _members;
  Self _self;
Groups copyWith({  int id,
  String groupName,
  String groupAdmin,
  String description,
  String image,
  List<Members> members,
  Self self,
}) => Groups(  id: id ?? _id,
  groupName: groupName ?? _groupName,
  groupAdmin: groupAdmin ?? _groupAdmin,
  description: description ?? _description,
  image: image ?? _image,
  members: members ?? _members,
  self: self ?? _self,
);
  int get id => _id;
  String get groupName => _groupName;
  String get groupAdmin => _groupAdmin;
  String get description => _description;
  String get image => _image;
  List<Members> get members => _members;
  Self get self => _self;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['group_name'] = _groupName;
    map['group_admin'] = _groupAdmin;
    map['description'] = _description;
    map['image'] = _image;
    if (_members != null) {
      map['members'] = _members.map((v) => v.toJson()).toList();
    }
    if (_self != null) {
      map['self'] = _self.toJson();
    }
    return map;
  }

}

/// pid : "4294967296"
/// name : "KUNAL PANDEY"

class Self {
  Self({
      String pid, 
      String name,}){
    _pid = pid;
    _name = name;
}

  Self.fromJson(dynamic json) {
    _pid = json['pid'];
    _name = json['name'];
  }
  String _pid;
  String _name;
Self copyWith({  String pid,
  String name,
}) => Self(  pid: pid ?? _pid,
  name: name ?? _name,
);
  String get pid => _pid;
  String get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pid'] = _pid;
    map['name'] = _name;
    return map;
  }

}

/// pid : "4294967302"
/// name : "ANIKET KUMAR"
/// fcm_token : null
/// profile_image : "users/tXel3OSGArzkWauD8veqCpd93bplmOpRA0gUbQkj.jpeg"

class Members {
  Members({
      String pid, 
      String name, 
      dynamic fcmToken,
      String email,
      String phone,
      String bio,
    String profileImage,}){
    _pid = pid;
    _name = name;
    _fcmToken = fcmToken;
    _profileImage = profileImage;
    _email = email;
    _phone = phone;
    _bio = bio;
}

  Members.fromJson(dynamic json) {
    _pid = json['pid'];
    _name = json['name'];
    _fcmToken = json['fcm_token'];
    _profileImage = json['profile_image'];
    _email = json['email'];
    _phone = json['phone'];
    _bio = json['bio'];
  }
  String _pid;
  String _name;
  dynamic _fcmToken;
  String _profileImage;
  String _email;
  String _phone;
  String _bio;
Members copyWith({  String pid,
  String name,
  dynamic fcmToken,
  String profileImage,
  String email,
  String phone,
  String bio,
}) => Members(  pid: pid ?? _pid,
  name: name ?? _name,
  fcmToken: fcmToken ?? _fcmToken,
  profileImage: profileImage ?? _profileImage,
  email: email ?? _email,
  phone: phone ?? _phone,
  bio: bio ?? _bio,
);
  String get pid => _pid;
  String get name => _name;
  dynamic get fcmToken => _fcmToken;
  String get profileImage => _profileImage;
  String get email => _email;
  String get phone => _phone;
  String get bio => _bio;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pid'] = _pid;
    map['name'] = _name;
    map['fcm_token'] = _fcmToken;
    map['profile_image'] = _profileImage;
    map['email'] = _email;
    map['phone'] = _phone;
    map['bio'] = _bio;
    return map;
  }

}