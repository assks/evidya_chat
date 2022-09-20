import 'package:evidya/model/login/response/result.dart';


part 'login_response.g.dart';


class LoginResponse {
  String status;
  int id;
  String token;
  Result result;


  LoginResponse({
    this.status,
    this.id,
    this.token,
    this.result,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
