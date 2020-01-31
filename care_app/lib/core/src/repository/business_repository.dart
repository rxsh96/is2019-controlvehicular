
import 'package:care_app/core/src/models/business.dart';
import 'package:care_app/core/locator.dart';
import 'package:care_app/core/services/careapp_api/api.dart';


class BusinessRepository{

  final API _api = locator<API>();

  List<Business> _business;


  Future<bool> fetchBusiness() async {
    _business = await _api.getBusiness();
    return _business != null;
  }

  List<Business> get business => _business;

}