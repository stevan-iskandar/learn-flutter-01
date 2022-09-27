import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Api extends http.BaseClient {
  Api({
    this.url = '',
  });

  final String url;

  final storage = const FlutterSecureStorage();

  String baseUrl = dotenv.env['APP_API_URL'] ?? 'http://localhost';

  Future<Map<String, String>> _setHeaders() async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    String? token = await storage.read(key: 'token');
    if (token != null) {
      headers = {
        ...headers,
        'Authorization': 'Bearer $token',
      };
    }

    return headers;
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
        // path: 'api/$url/${request.url.path}',
        pathSegments: [
          'api',
          if (url != '') url,
          ...request.url.pathSegments,
        ],
        query: request.url.query,
        fragment: request.url.fragment,
      ),
    );

    baseRequest.headers.addAll(await _setHeaders());
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
