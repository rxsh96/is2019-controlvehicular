import 'dart:io';

import 'package:care_app/core/locator.dart';
import 'package:care_app/core/services/auth/auth_service.dart';
import 'package:care_app/core/src/enums/my_enum.dart';
import 'package:care_app/core/src/models/user_model.dart';
import 'package:care_app/core/src/repository/user_repository.dart';

import 'base_provider.dart';

class LoginProvider extends BaseProvider {

  LoginProvider.instance() : _auth = AuthenticationService.instance{
    setAuthStatus(AuthStatus.Uninitialized);
    isSignedIn();
  }

  final UserRepository _userRepository = locator<UserRepository>();

  AuthenticationService _auth;


  Future<Map<String, dynamic>> saveUser(Map<String, dynamic> user) async {
    setState(ViewState.Busy);
    final Map<String, dynamic> response = await _userRepository.addUser(user);
    setState(ViewState.Idle);
    return response;
  }

  Future<String> saveProfilePic(File image) async {
    setState(ViewState.Busy);
    final String response = await _userRepository.uploadProfilePic(image);
    setState(ViewState.Idle);
    return response;
  }

  Future<void> getProfilePic() async {
    setState(ViewState.Busy);
    final User u = await _auth.loadAuthUser();
    await _userRepository.getProfilePicURL(u.id);
    setState(ViewState.Idle);
  }

  Future<bool> saveImage(Map<String, dynamic> image) async {
    setState(ViewState.Busy);
    final bool response = await _userRepository.addImage(image);
    setState(ViewState.Idle);
    return response;
  }
  
  Future<bool> resetPassword(Map<String, dynamic> data) async {
    setState(ViewState.Busy);
    final bool response = await _userRepository.passwordReset(data);
    setState(ViewState.Idle);
    return response;
  }


  Future<bool> isSignedIn() async {
    final bool hasToken = await _auth.hasToken();
    if(hasToken){
      _userRepository.user = await _auth.loadAuthUser();
      setAuthStatus(AuthStatus.Authenticated);
      return true;
    }
    setAuthStatus(AuthStatus.Unauthenticated);
    return false;
  }

  Future<bool> signIn(String email, String password) async {
    setState(ViewState.Busy);
    setAuthStatus(AuthStatus.Authenticating);
    final bool response =  await _auth.authenticate(email: email, password: password);
    if(response){
      _userRepository.user = await _auth.loadAuthUserWithEmail(email: email);
      setAuthStatus(AuthStatus.Authenticated);
    }
    setState(ViewState.Idle);
    return response;
  }

  Future<void> signOut() async {
    _auth.deleteToken();
    setAuthStatus(AuthStatus.Unauthenticated);
  }


  String get profileImageURL => _userRepository.profileImageURL;

  UserRepository get userRepository => _userRepository;

}