import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/repository/business_repository.dart';

import 'base_provider.dart';

class BusinessProvider extends BaseProvider{

  final BusinessRepository _businessRepository = locator<BusinessRepository>();

  Future<bool> fetchBusiness() async{
    setState(ViewState.Busy);
    final bool response = await _businessRepository.fetchBusiness();
    setState(ViewState.Idle);
    notifyListeners();
    return response;
  }


  List<dynamic> get business => _businessRepository.business;

}