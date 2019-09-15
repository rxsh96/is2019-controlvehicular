import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  static final baseUrl = "http://192.168.0.152:8000/api/";

  static ApiService _instance = new ApiService.internal();
  ApiService.internal();
  factory ApiService() => _instance;
  final JsonDecoder _decoder = new JsonDecoder();


  Future<dynamic> get(String url) {
    return http.get(baseUrl+url).then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" + statusCode.toString() +
            ",\"message\":\"error\",\"response\":" + res + "}";
        throw new Exception(statusCode);
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {Map<String, String> body}) {
    return http.post(baseUrl+url, body: body)
        .then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" + statusCode.toString() +
            ",\"message\":\"error\",\"response\":" + res + "}";
        throw new Exception(statusCode);
      }
      return _decoder.convert(res);
    });
  }

}
