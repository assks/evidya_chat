/// responseMessage : {"reasonPhrase":"Success.","statusCode":200,"isSuccessStatusCode":true}
/// data : {"firstName":null,"lastName":null,"emailOTP":null,"emailOTPRequestedDate":null,"emailOTPVerifiedDate":null,"phoneOTP":null,"phoneOTPRequestedDate":null,"phoneOTPVerifiedDate":null,"profilePic":null,"isDeactivated":false,"lastLoginTime":null,"lastLogoutTime":null,"lat":null,"lng":null,"isApproved":null,"deviceToken":null,"devicetype":null,"signupStep":0,"createdDate":null,"modifiedDate":null,"createdBy":null,"modifiedBy":null,"isActive":false,"id":"fc5439d6-102f-401b-9e0f-01a71f2790fb","userName":null,"normalizedUserName":null,"email":"admin@GiftCocktail.com","normalizedEmail":null,"emailConfirmed":true,"passwordHash":null,"securityStamp":"f1dc200f-c82e-43c2-9e82-456a0ad1f696","concurrencyStamp":"26f74da3-364b-4a06-874b-9021808acc88","phoneNumber":null,"phoneNumberConfirmed":false,"twoFactorEnabled":false,"lockoutEnd":null,"lockoutEnabled":false,"accessFailedCount":0}

class Profile {
  ResponseMessage _responseMessage;
  Data _data;

  ResponseMessage get responseMessage => _responseMessage;
  Data get data => _data;

  Profile({
      ResponseMessage responseMessage, 
      Data data}){
    _responseMessage = responseMessage;
    _data = data;
}

  Profile.fromJson(dynamic json) {
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

/// firstName : null
/// lastName : null
/// emailOTP : null
/// emailOTPRequestedDate : null
/// emailOTPVerifiedDate : null
/// phoneOTP : null
/// phoneOTPRequestedDate : null
/// phoneOTPVerifiedDate : null
/// profilePic : null
/// isDeactivated : false
/// lastLoginTime : null
/// lastLogoutTime : null
/// lat : null
/// lng : null
/// isApproved : null
/// deviceToken : null
/// devicetype : null
/// signupStep : 0
/// createdDate : null
/// modifiedDate : null
/// createdBy : null
/// modifiedBy : null
/// isActive : false
/// id : "fc5439d6-102f-401b-9e0f-01a71f2790fb"
/// userName : null
/// normalizedUserName : null
/// email : "admin@GiftCocktail.com"
/// normalizedEmail : null
/// emailConfirmed : true
/// passwordHash : null
/// securityStamp : "f1dc200f-c82e-43c2-9e82-456a0ad1f696"
/// concurrencyStamp : "26f74da3-364b-4a06-874b-9021808acc88"
/// phoneNumber : null
/// phoneNumberConfirmed : false
/// twoFactorEnabled : false
/// lockoutEnd : null
/// lockoutEnabled : false
/// accessFailedCount : 0

class Data {
  dynamic _firstName;
  dynamic _lastName;
  dynamic _emailOTP;
  dynamic _emailOTPRequestedDate;
  dynamic _emailOTPVerifiedDate;
  dynamic _phoneOTP;
  dynamic _phoneOTPRequestedDate;
  dynamic _phoneOTPVerifiedDate;
  dynamic _profilePic;
  bool _isDeactivated;
  dynamic _lastLoginTime;
  dynamic _lastLogoutTime;
  dynamic _lat;
  dynamic _lng;
  dynamic _isApproved;
  dynamic _deviceToken;
  dynamic _devicetype;
  int _signupStep;
  dynamic _createdDate;
  dynamic _modifiedDate;
  dynamic _createdBy;
  dynamic _modifiedBy;
  bool _isActive;
  String _id;
  dynamic _userName;
  dynamic _normalizedUserName;
  String _email;
  dynamic _normalizedEmail;
  bool _emailConfirmed;
  dynamic _passwordHash;
  String _securityStamp;
  String _concurrencyStamp;
  dynamic _phoneNumber;
  bool _phoneNumberConfirmed;
  bool _twoFactorEnabled;
  dynamic _lockoutEnd;
  bool _lockoutEnabled;
  int _accessFailedCount;

  dynamic get firstName => _firstName;
  dynamic get lastName => _lastName;
  dynamic get emailOTP => _emailOTP;
  dynamic get emailOTPRequestedDate => _emailOTPRequestedDate;
  dynamic get emailOTPVerifiedDate => _emailOTPVerifiedDate;
  dynamic get phoneOTP => _phoneOTP;
  dynamic get phoneOTPRequestedDate => _phoneOTPRequestedDate;
  dynamic get phoneOTPVerifiedDate => _phoneOTPVerifiedDate;
  dynamic get profilePic => _profilePic;
  bool get isDeactivated => _isDeactivated;
  dynamic get lastLoginTime => _lastLoginTime;
  dynamic get lastLogoutTime => _lastLogoutTime;
  dynamic get lat => _lat;
  dynamic get lng => _lng;
  dynamic get isApproved => _isApproved;
  dynamic get deviceToken => _deviceToken;
  dynamic get devicetype => _devicetype;
  int get signupStep => _signupStep;
  dynamic get createdDate => _createdDate;
  dynamic get modifiedDate => _modifiedDate;
  dynamic get createdBy => _createdBy;
  dynamic get modifiedBy => _modifiedBy;
  bool get isActive => _isActive;
  String get id => _id;
  dynamic get userName => _userName;
  dynamic get normalizedUserName => _normalizedUserName;
  String get email => _email;
  dynamic get normalizedEmail => _normalizedEmail;
  bool get emailConfirmed => _emailConfirmed;
  dynamic get passwordHash => _passwordHash;
  String get securityStamp => _securityStamp;
  String get concurrencyStamp => _concurrencyStamp;
  dynamic get phoneNumber => _phoneNumber;
  bool get phoneNumberConfirmed => _phoneNumberConfirmed;
  bool get twoFactorEnabled => _twoFactorEnabled;
  dynamic get lockoutEnd => _lockoutEnd;
  bool get lockoutEnabled => _lockoutEnabled;
  int get accessFailedCount => _accessFailedCount;

  Data({
      dynamic firstName, 
      dynamic lastName, 
      dynamic emailOTP, 
      dynamic emailOTPRequestedDate, 
      dynamic emailOTPVerifiedDate, 
      dynamic phoneOTP, 
      dynamic phoneOTPRequestedDate, 
      dynamic phoneOTPVerifiedDate, 
      dynamic profilePic, 
      bool isDeactivated, 
      dynamic lastLoginTime, 
      dynamic lastLogoutTime, 
      dynamic lat, 
      dynamic lng, 
      dynamic isApproved, 
      dynamic deviceToken, 
      dynamic devicetype, 
      int signupStep, 
      dynamic createdDate, 
      dynamic modifiedDate, 
      dynamic createdBy, 
      dynamic modifiedBy, 
      bool isActive, 
      String id, 
      dynamic userName, 
      dynamic normalizedUserName, 
      String email, 
      dynamic normalizedEmail, 
      bool emailConfirmed, 
      dynamic passwordHash, 
      String securityStamp, 
      String concurrencyStamp, 
      dynamic phoneNumber, 
      bool phoneNumberConfirmed, 
      bool twoFactorEnabled, 
      dynamic lockoutEnd, 
      bool lockoutEnabled, 
      int accessFailedCount}){
    _firstName = firstName;
    _lastName = lastName;
    _emailOTP = emailOTP;
    _emailOTPRequestedDate = emailOTPRequestedDate;
    _emailOTPVerifiedDate = emailOTPVerifiedDate;
    _phoneOTP = phoneOTP;
    _phoneOTPRequestedDate = phoneOTPRequestedDate;
    _phoneOTPVerifiedDate = phoneOTPVerifiedDate;
    _profilePic = profilePic;
    _isDeactivated = isDeactivated;
    _lastLoginTime = lastLoginTime;
    _lastLogoutTime = lastLogoutTime;
    _lat = lat;
    _lng = lng;
    _isApproved = isApproved;
    _deviceToken = deviceToken;
    _devicetype = devicetype;
    _signupStep = signupStep;
    _createdDate = createdDate;
    _modifiedDate = modifiedDate;
    _createdBy = createdBy;
    _modifiedBy = modifiedBy;
    _isActive = isActive;
    _id = id;
    _userName = userName;
    _normalizedUserName = normalizedUserName;
    _email = email;
    _normalizedEmail = normalizedEmail;
    _emailConfirmed = emailConfirmed;
    _passwordHash = passwordHash;
    _securityStamp = securityStamp;
    _concurrencyStamp = concurrencyStamp;
    _phoneNumber = phoneNumber;
    _phoneNumberConfirmed = phoneNumberConfirmed;
    _twoFactorEnabled = twoFactorEnabled;
    _lockoutEnd = lockoutEnd;
    _lockoutEnabled = lockoutEnabled;
    _accessFailedCount = accessFailedCount;
}

  Data.fromJson(dynamic json) {
    _firstName = json["firstName"];
    _lastName = json["lastName"];
    _emailOTP = json["emailOTP"];
    _emailOTPRequestedDate = json["emailOTPRequestedDate"];
    _emailOTPVerifiedDate = json["emailOTPVerifiedDate"];
    _phoneOTP = json["phoneOTP"];
    _phoneOTPRequestedDate = json["phoneOTPRequestedDate"];
    _phoneOTPVerifiedDate = json["phoneOTPVerifiedDate"];
    _profilePic = json["profilePic"];
    _isDeactivated = json["isDeactivated"];
    _lastLoginTime = json["lastLoginTime"];
    _lastLogoutTime = json["lastLogoutTime"];
    _lat = json["lat"];
    _lng = json["lng"];
    _isApproved = json["isApproved"];
    _deviceToken = json["deviceToken"];
    _devicetype = json["devicetype"];
    _signupStep = json["signupStep"];
    _createdDate = json["createdDate"];
    _modifiedDate = json["modifiedDate"];
    _createdBy = json["createdBy"];
    _modifiedBy = json["modifiedBy"];
    _isActive = json["isActive"];
    _id = json["id"];
    _userName = json["userName"];
    _normalizedUserName = json["normalizedUserName"];
    _email = json["email"];
    _normalizedEmail = json["normalizedEmail"];
    _emailConfirmed = json["emailConfirmed"];
    _passwordHash = json["passwordHash"];
    _securityStamp = json["securityStamp"];
    _concurrencyStamp = json["concurrencyStamp"];
    _phoneNumber = json["phoneNumber"];
    _phoneNumberConfirmed = json["phoneNumberConfirmed"];
    _twoFactorEnabled = json["twoFactorEnabled"];
    _lockoutEnd = json["lockoutEnd"];
    _lockoutEnabled = json["lockoutEnabled"];
    _accessFailedCount = json["accessFailedCount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["emailOTP"] = _emailOTP;
    map["emailOTPRequestedDate"] = _emailOTPRequestedDate;
    map["emailOTPVerifiedDate"] = _emailOTPVerifiedDate;
    map["phoneOTP"] = _phoneOTP;
    map["phoneOTPRequestedDate"] = _phoneOTPRequestedDate;
    map["phoneOTPVerifiedDate"] = _phoneOTPVerifiedDate;
    map["profilePic"] = _profilePic;
    map["isDeactivated"] = _isDeactivated;
    map["lastLoginTime"] = _lastLoginTime;
    map["lastLogoutTime"] = _lastLogoutTime;
    map["lat"] = _lat;
    map["lng"] = _lng;
    map["isApproved"] = _isApproved;
    map["deviceToken"] = _deviceToken;
    map["devicetype"] = _devicetype;
    map["signupStep"] = _signupStep;
    map["createdDate"] = _createdDate;
    map["modifiedDate"] = _modifiedDate;
    map["createdBy"] = _createdBy;
    map["modifiedBy"] = _modifiedBy;
    map["isActive"] = _isActive;
    map["id"] = _id;
    map["userName"] = _userName;
    map["normalizedUserName"] = _normalizedUserName;
    map["email"] = _email;
    map["normalizedEmail"] = _normalizedEmail;
    map["emailConfirmed"] = _emailConfirmed;
    map["passwordHash"] = _passwordHash;
    map["securityStamp"] = _securityStamp;
    map["concurrencyStamp"] = _concurrencyStamp;
    map["phoneNumber"] = _phoneNumber;
    map["phoneNumberConfirmed"] = _phoneNumberConfirmed;
    map["twoFactorEnabled"] = _twoFactorEnabled;
    map["lockoutEnd"] = _lockoutEnd;
    map["lockoutEnabled"] = _lockoutEnabled;
    map["accessFailedCount"] = _accessFailedCount;
    return map;
  }

}

/// reasonPhrase : "Success."
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