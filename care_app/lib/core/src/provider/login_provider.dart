
import 'package:care_app/core/services/auth/auth_service.dart';
import 'package:care_app/core/src/enums/my_enum.dart';
import 'package:care_app/core/src/models/user_model.dart';

import 'base_provider.dart';

class LoginProvider extends BaseProvider {

  LoginProvider.instance() : _auth = AuthenticationService.instance{
    setAuthStatus(AuthStatus.Uninitialized);
    isSignedIn();
  }

  AuthenticationService _auth;
  User _user;

  User get user => _user;

  Future<bool> isSignedIn() async {
    final bool hasToken = await _auth.hasToken();
    if(hasToken){
      _user = await _auth.loadAuthUser();
      setAuthStatus(AuthStatus.Authenticated);
      notifyListeners();
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
      _user = await _auth.loadAuthUserWithEmail(email: email);
      setAuthStatus(AuthStatus.Authenticated);
      notifyListeners();
    }
    setState(ViewState.Idle);
    return response;
  }

  Future<void> signOut() async {
    _auth.deleteToken();
    setAuthStatus(AuthStatus.Unauthenticated);
  }

}