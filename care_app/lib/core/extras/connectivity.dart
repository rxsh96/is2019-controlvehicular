import 'package:connectivity/connectivity.dart';

class MyConnectivity{

  static Future<bool> checkConnectivity() async {
    final ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

}