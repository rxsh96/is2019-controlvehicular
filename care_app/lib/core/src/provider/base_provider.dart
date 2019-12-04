import 'package:care_app/core/src/enums/my_enum.dart';
import 'package:flutter/foundation.dart';

class BaseProvider extends ChangeNotifier {

  ViewState _state = ViewState.Idle;
  AuthStatus _authStatus = AuthStatus.Uninitialized;
  AuthEvent _authEvent = AuthEvent.AppStarted;

  ViewState get state => _state;
  AuthStatus get authStatus => _authStatus;

  AuthEvent get authEvent => _authEvent;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setAuthStatus(AuthStatus authStatus){
    _authStatus = authStatus;
    notifyListeners();
  }

  void setAuthEvent(AuthEvent authEvent){
    _authEvent = authEvent;
    notifyListeners();
  }

}