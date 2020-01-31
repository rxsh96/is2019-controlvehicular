import 'package:care_app/core/src/provider/business_provider.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:care_app/core/src/repository/business_repository.dart';
import 'package:care_app/core/src/repository/user_repository.dart';
import 'package:care_app/core/src/repository/vehicle_repository.dart';
import 'package:get_it/get_it.dart';
import 'services/careapp_api/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerLazySingleton<API>(() => API());
  //locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  locator.registerLazySingleton<VehicleRepository>(() => VehicleRepository());
  locator.registerLazySingleton<UserRepository>(() => UserRepository());
  locator.registerLazySingleton<BusinessRepository>(() => BusinessRepository());

  locator.registerFactory<LoginProvider>(() => LoginProvider.instance());
  locator.registerFactory<VehicleProvider>(() => VehicleProvider());
  locator.registerFactory<BusinessProvider>(() => BusinessProvider());

}