import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:care_app/core/src/models/user_model.dart';

import '../../locator.dart';

class UserRepository{

  final API _api = locator<API>();

  Future<bool> addUser(Map<String, dynamic> user) async {
    final Map<String, dynamic> response = await _api.postUser(user: user);
    return !response.containsKey('error');
  }

}