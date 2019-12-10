import 'package:flutter/foundation.dart';

///Class to handle network responses
class MyResponse {

  MyResponse({@required this.isSuccess, @required this.message, this.result});

  bool isSuccess;
  String message;
  Object result;
}