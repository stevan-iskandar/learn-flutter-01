import 'package:http/http.dart';
import 'api.dart';

class AuthApi extends Api {
  // AuthApi() : super();

  Future<Response> login({
    required String email,
    required String password,
  }) async {
    return this.post(
      Uri(path: 'login'),
      body: {
        'email': email,
        'password': password,
      },
    );
  }
}
