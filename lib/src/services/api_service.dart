import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService extends http.BaseClient {
  String baseUrl = dotenv.env['APP_API_URL'] ?? 'http://localhost';
  String? token = 'asdasdasd';

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token != null ? 'Bearer $token' : '',
      };

  Uri url(Uri uri, [Map<String, String?>? queryParameters]) {
    // final slashBaseUrl = baseUrl.substring(baseUrl.length - 1);
    // final slashPath = path.substring(0, 1);

    // if (slashBaseUrl == '/') baseUrl = baseUrl.substring(0, baseUrl.length - 1);
    // if (slashPath == '/') path = path.substring(1, path.length);

    return Uri(path: uri.path);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final client = http.Client();
    final Uri uri = Uri.parse(baseUrl);

    http.BaseRequest baseRequest = http.Request(
      request.method,
      Uri(
        scheme: uri.scheme,
        userInfo: request.url.userInfo,
        host: uri.host,
        port: uri.port,
        path: request.url.path,
        query: request.url.query,
        fragment: request.url.fragment,
      ),
    );

    baseRequest.headers.addAll(_setHeaders());
    http.StreamedResponse response;

    response = await client.send(baseRequest).then((response) {
      try {
        if (response.statusCode != 200) {
          throw HttpException('${response.statusCode}');
        }
      } on SocketException {
        debugPrint('No Internet connection 😑');
      } on HttpException {
        debugPrint("Couldn't find the post 😱");
      } on FormatException {
        debugPrint('Bad response format 👎');
      }
      return response;
    });
    client.close();
    return response;
  }
}
