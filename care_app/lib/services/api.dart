import 'dart:convert';

import 'package:dio/dio.dart';

class API {
  final String apiBaseAddress = "http://192.168.0.152:8000/api/";
  final JsonDecoder _decoder = new JsonDecoder();
  final JsonEncoder _encoder = new JsonEncoder();

  Dio _createDioClient() {
    BaseOptions options = new BaseOptions(
      baseUrl: apiBaseAddress,
      responseType: ResponseType.stream,
    );
    return new Dio(options);
  }

  Future<dynamic> get({endPoint, queryParameters}) async {
    var client = _createDioClient();

    return client.get(endPoint, queryParameters: queryParameters).then(
      (Response response) {
        int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception(statusCode);
        }
        print(response);
        print(response.data);
        return response.data;
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
