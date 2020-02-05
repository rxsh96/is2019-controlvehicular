import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:care_app/core/services/careapp_api/response.dart';

///This class contains our network [http] client for handle network calls.
class ApiHelper {
  ///Singleton for Network Client
  factory ApiHelper() => _instance;
  ApiHelper.internal();
  static final ApiHelper _instance = ApiHelper.internal();

  ///Contains the Base URL for API
  static const String _BASE_URL = 'https://controlvehicular.pythonanywhere.com/api/';

  http.Client getHttpClient() {
    return http.Client();
  }

  ///Generic [http.post(url)] method.
  Future<MyResponse> post<T>(
      {@required String endPoint, @required Map<String, dynamic> data}) async {
    try {
      final http.Response response =
          await getHttpClient().post(_BASE_URL + endPoint, body: data);
      if (response.statusCode < 200 || response.statusCode > 400) {
        return MyResponse(isSuccess: false, message: response.toString());
      }
      return MyResponse(isSuccess: true, message: 'Ok', result: response.body);
    } catch (e) {
      print(e);
      return MyResponse(isSuccess: false, message: e.toString());
    }
  }

  ///Generic [http.get(url)] method.
  Future<MyResponse> get<T>(
      {@required String endPoint, String queryParam = ''}) async {
    try {
      final http.Response response =
          await getHttpClient().get(_BASE_URL + endPoint + queryParam);
      if (response.statusCode < 200 || response.statusCode > 400) {
        return MyResponse(isSuccess: false, message: response.toString());
      }
      return MyResponse(isSuccess: true, message: 'Ok', result: response.body);
    } catch (e) {
      print(e);
      return MyResponse(isSuccess: false, message: e.toString());
    }
  }

  ///Generic [http.get(url)] method.
  Future<MyResponse> put<T>(
      {@required String endPoint, @required String instance, @required Map<String, dynamic> data}) async {
    try {
      print(_BASE_URL + endPoint + instance);
      final http.Response response =
      await getHttpClient().put(_BASE_URL + endPoint + instance + '/', body: data);
      if (response.statusCode < 200 || response.statusCode > 400) {
        return MyResponse(isSuccess: false, message: response.toString());
      }
      return MyResponse(isSuccess: true, message: 'Ok', result: response.body);
    } catch (e) {
      print(e);
      return MyResponse(isSuccess: false, message: e.toString());
    }
  }

}
