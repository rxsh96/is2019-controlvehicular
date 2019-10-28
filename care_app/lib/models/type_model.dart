import 'package:care_app/models/user_model.dart';
import 'package:care_app/models/vehicle_model.dart';

class Type{

  static dynamic fromJson<T>(dynamic json) {
    if (T == User) {
      return User.fromJson(json);
    }
    else if (T == Vehicle) {
      return Vehicle.fromJson(json);
    }
    else {
      throw Exception('Unknown class');
    }
  }

}
