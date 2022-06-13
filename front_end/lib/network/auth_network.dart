import 'package:dio/dio.dart';

import '../core/value/constants/app_constants.dart';

class AuthNetwork {
  static Future<Response> logIn(email, password) async {
    return await Dio().post(
      ApiPath.loginAPI,
      data: {
        'email': email,
        'password': password,
      },
    );
  }

  static Future<Response> getUser(String token) async {
    Map<String, dynamic> authHeader = {'Authorization': 'bearer $token'};
    return await Dio().get(
      '$ApiPath/getUser',
      options: Options(headers: authHeader),
    );
  }
}
