import 'package:dio/dio.dart';
import 'api.dart';

class AuthApi extends Api {
  // AuthApi() : super();

  Future<Response> login({
    required String email,
    required String password,
  }) async {
    return api.post(
      'login',
      data: {
        'email': email,
        'password': password,
      },
    );
  }
}
