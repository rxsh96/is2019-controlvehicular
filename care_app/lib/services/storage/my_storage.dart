
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySecureStorage {

  factory MySecureStorage() {
    return _instance;
  }

  MySecureStorage._internal() {
    storage = const FlutterSecureStorage();
    _initSharedPreferences();
  }

  static final MySecureStorage _instance = MySecureStorage._internal();
  static FlutterSecureStorage storage;
  static SharedPreferences preferences;

  Future<void> _initSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  static MySecureStorage get instance => _instance;


}
