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
<<<<<<< HEAD
  static const String _BASE_URL = 'http://172.20.139.77:8000/api/';
=======
  static const String _BASE_URL = 'http://http://472713ae.ngrok.io/api/';
>>>>>>> a38e2c40c1b3c8551b192c0de965955a77067a77

  http.Client getHttpClient() {
    return http.Client();
  }

  ///Generic [http.post(url)] method.
  Future<MyResponse> post<T>(
      {@required String endPoint, @required Map<String, dynamic> data}) async {
    print('EN API HELPER POST, DATA ES: $data');
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
}
