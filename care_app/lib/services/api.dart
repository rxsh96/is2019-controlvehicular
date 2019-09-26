import 'dart:convert';

import 'package:dio/dio.dart';

class API {
  final String apiBaseAddress = "http://192.168.0.121:8000/api/";
  final JsonDecoder _decoder = new JsonDecoder();
  final JsonEncoder _encoder = new JsonEncoder();

  Dio _createDioClient() {
    BaseOptions options = new BaseOptions(
      baseUrl: apiBaseAddress,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    return new Dio(options);
  }

  Future<dynamic> get({endPoint, id, queryParameters}) async {
    var url = '$endPoint/$id/';

    return _createDioClient().get(url, queryParameters: queryParameters).then(
      (Response response) {
        String res = response.data;
        int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400 || json == null) {
          res = "{\"status\":" +
              statusCode.toString() +
              ",\"message\":\"error\",\"response\":" +
              res +
              "}";
          throw new Exception(statusCode);
        }
        return _decoder.convert(res);
      },
    );
  }

  Future<dynamic> post({endPoint, model}) async {
    var data = _encoder.convert(model);
    return _createDioClient().post(endPoint, data: data).then(
      (Response response) {
        String res = response.data;
        int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400 || json == null) {
          res = "{\"status\":" +
              statusCode.toString() +
              ",\"message\":\"error\",\"response\":" +
              res +
              "}";
          throw new Exception(statusCode);
        }
        return _decoder.convert(res);
      },
    );
  }
}
