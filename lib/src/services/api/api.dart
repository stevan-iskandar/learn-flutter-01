import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../constants/env.dart';
import '../../constants/storages.dart';

class Api with ChangeNotifier {
  Api({
    this.url = '',
  });

  final String url;

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  late Dio api;

  Future<Map<String, dynamic>> _setHeaders() async {
    Map<String, dynamic> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    String? token = await storage.read(key: Storages.token);
    if (token != null) {
      headers = {
        ...headers,
        'Authorization': 'Bearer $token',
      };
    }

    return headers;
  }

  Future<void> loadApi() async {
    var headers = await _setHeaders();
    debugPrint(headers.toString());
    api = Dio(
      BaseOptions(
        baseUrl: '${dotenv.env[Env.apiUrl] ?? 'http://localhost'}/api/',
        headers: await _setHeaders(),
      ),
    );

    api.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError error, handler) {
        debugPrint(error.response!.statusCode.toString());
        debugPrint(error.response!.data.toString());
        return handler.next(error);
      },
    ));

    notifyListeners();
  }

  Future<void> updateApi(String token) async {
    await storage.write(key: Storages.token, value: token);

    await loadApi();

    notifyListeners();
  }
}
