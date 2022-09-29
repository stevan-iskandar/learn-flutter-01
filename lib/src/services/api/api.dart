import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api {
  Api({
    this.url = '',
  });

  final String url;

  final Dio api = Dio(
    BaseOptions(
      baseUrl: dotenv.env['APP_API_URL'] ?? 'http://localhost',
      headers: _setHeaders(),
    ),
  );
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Map<String, dynamic> _setHeaders() async {
    Map<String, dynamic> headers = {
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
}
