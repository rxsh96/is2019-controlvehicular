import 'dart:io';

import 'package:care_app/core/locator.dart';
import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/models/brand_model.dart';
import 'package:care_app/core/src/models/business.dart';
import 'package:care_app/core/src/models/model_files.dart';
import 'package:care_app/core/src/models/model_model.dart';
import 'package:care_app/core/src/repository/business_repository.dart';

import 'base_provider.dart';

class BusinessProvider extends BaseProvider{

  final API _api = locator<API>();

  final BusinessRepository _vehicleRepository = locator<BusinessRepository>();

  List<Business> _business;

  Future<List<Business>> fetchBusiness() async{
    setState(ViewState.Busy);
    final List<Business> business = await _api.getBusiness();
    _business = business;
    setState(ViewState.Idle);
    notifyListeners();
    return business;
  }


  List<dynamic> get brandsModels => _vehicleRepository.business;

}