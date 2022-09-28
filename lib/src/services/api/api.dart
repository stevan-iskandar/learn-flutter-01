import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class Api extends BaseClient {
  Api({
    this.url = '',
  });

  final String url;

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Uri baseUrl =
      Uri.parse(dotenv.env['APP_API_URL'] ?? 'http://localhost');

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
  Future<StreamedResponse> send(BaseRequest request) async {
    final client = Client();

    request.headers.addAll(await _setHeaders());

    return client.send(request).then((response) {
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
    }).whenComplete(() => client.close());
  }

  Uri baseUri(Uri uri) => Uri(
        scheme: baseUrl.scheme,
        userInfo: uri.userInfo,
        host: baseUrl.host,
        port: baseUrl.port,
        // path: 'api/$url/${uri.path}',
        pathSegments: [
          'api',
          if (url != '') url,
          ...uri.pathSegments,
        ],
        query: uri.query,
        fragment: uri.fragment,
      );

  Future<Response> basePost(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return this.post(
      baseUri(url),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }
}
