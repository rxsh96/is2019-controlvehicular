import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

  factory ApiService() => _instance;
  ApiService.internal();

  static const String baseUrl = 'http:// 172.20.134.89:8000/api/';
  static final ApiService _instance = ApiService.internal();

  final JsonDecoder _decoder = const JsonDecoder();

  Future<dynamic> get<T>(String url) {
    return http.get(baseUrl + url).then<T>((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception(statusCode);
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post<T>(String url, {Map<String, String> body}) {
    return http.post(baseUrl + url, body: body).then<T>((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception(statusCode);
      }
      return _decoder.convert(res);
    });
  }
}
