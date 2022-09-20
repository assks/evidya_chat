import 'package:dio/dio.dart' hide Headers;
import 'package:evidya/constants/url_constant.dart';
import 'package:evidya/model/login/request/login_request.dart';
import 'package:evidya/model/login/response/login_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_rest_client.g.dart';

@RestApi(baseUrl: "")
abstract class ApiRestClient {
  factory ApiRestClient(Dio dio) = _ApiRestClient;

  /*Login Api*/
  @POST(UrlConstant.BASE_URL + UrlConstant.LOGIN)
  @FormUrlEncoded()
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST(UrlConstant.BASE_URL + UrlConstant.LOGIN)
  @FormUrlEncoded()
  Future<LoginResponse> loginWithJson(@Body() String json);
}
