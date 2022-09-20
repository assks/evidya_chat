// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiRestClient implements ApiRestClient {
  _ApiRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  // Future<LoginResponse> login(loginRequest) async {
  //   ArgumentError.checkNotNull(loginRequest, 'loginRequest');
  //   const _extra = <String, dynamic>{};
  //   final queryParameters = <String, dynamic>{};
  //   final _data = <String, dynamic>{};
  //   _data.addAll(loginRequest?.toJson() ?? <String, dynamic>{});
  //   final _result = await _dio.request<Map<String, dynamic>>(
  //       'https://reqres.in/api/register',
  //       queryParameters: queryParameters,
  //        options: RequestOptions(
  //           method: 'POST',
  //           headers: <String, dynamic>{},
  //           extra: _extra,
  //           contentType: 'application/x-www-form-urlencoded',
  //           baseUrl: baseUrl),
  //       data: _data);
  //   final value = LoginResponse.fromJson(_result.data);
  //   return value;
  // }

  @override
  Future<LoginResponse> loginWithJson(String json) {
    // TODO: implement loginWithJson
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
