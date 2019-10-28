import 'dart:convert';

import 'package:dio/dio.dart';

class API {
  final String apiBaseAddress = 'http://172.20.134.89:8000/api/';
  final JsonDecoder _decoder = const JsonDecoder();
  final JsonEncoder _encoder = const JsonEncoder();

  Dio _createDioClient() {
    final BaseOptions options = BaseOptions(
      baseUrl: apiBaseAddress,
      responseType: ResponseType.stream,
    );
    return Dio(options);
  }

  Future<dynamic> get<T>({String endPoint, Map<String, dynamic> queryParameters}) async {
    final Dio client = _createDioClient();
    return client.get<T>(endPoint, queryParameters: queryParameters).then<T>(
      (Response<T> response) {
        final int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw Exception(statusCode);
        }
        return response.data;
      },
    );
  }

  Future<dynamic> post<T>({String endPoint, T model}) async {
    final String data = _encoder.convert(model);
    return _createDioClient().post<T>(endPoint, data: data).then<T>(
      (Response<T> response) {
        final int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw Exception(statusCode);
        }
        return response.data;
      },
    );
  }
}
