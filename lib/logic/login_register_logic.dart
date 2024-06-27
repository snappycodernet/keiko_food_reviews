import 'package:flutter/material.dart';
import 'package:keiko_food_reviews/helper/validators.dart';

import '../services/authentication_service_base.dart';

class LoginRegisterInfo {
  LoginRegisterInfo({
    required this.buttonLoginRegisterEnabled,
    required this.showLoginRegisterError,
    required this.loginRegisterErrorMessage,
  });

  bool buttonLoginRegisterEnabled;
  bool showLoginRegisterError;
  String? loginRegisterErrorMessage;
}

class LoginRegisterLogic extends ChangeNotifier {
  bool _isEmailOk = false;
  bool _isPasswordOk = false;
  bool _isPasswordConfirmOk = false;

  final AuthenticationServiceBase authService;

  LoginRegisterLogic({required this.authService});

  final LoginRegisterInfo _loginRegisterInfo = LoginRegisterInfo(
    buttonLoginRegisterEnabled: false,
    showLoginRegisterError: false,
    loginRegisterErrorMessage: null,
  );

  LoginRegisterInfo get loginRegisterInfo {
    return _loginRegisterInfo;
  }

  // User forgot password page
  void checkLoginEmail({required String email}) {
    _loginRegisterInfo.showLoginRegisterError = false;
    _isEmailOk = Validators.email(email: email);
    _loginRegisterInfo.buttonLoginRegisterEnabled = _isEmailOk;

    notifyListeners();
  }

  void checkLoginEmailAndPassword({required String email, required String password}) {
    _loginRegisterInfo.showLoginRegisterError = false;
    _isEmailOk = Validators.email(email: email);
    _isPasswordOk = Validators.password(password: password);
    _loginRegisterInfo.buttonLoginRegisterEnabled = _isEmailOk && _isPasswordOk;

    notifyListeners();
  }

  void checkRegisterEmailAndPasswordAndConfirm({
    required String email,
    required String password,
    required String passwordConfirm
  }) {
    _loginRegisterInfo.showLoginRegisterError = false;
    _isEmailOk = Validators.email(email: email);
    _isPasswordOk = Validators.password(password: password);
    _isPasswordConfirmOk = Validators.password(password: passwordConfirm) && password == passwordConfirm;
    _loginRegisterInfo.buttonLoginRegisterEnabled = _isEmailOk && _isPasswordOk && _isPasswordConfirmOk;

    notifyListeners();
  }

  void showLoginErrorWithMessage({required String message}) {
    _loginRegisterInfo.showLoginRegisterError = true;
    _loginRegisterInfo.loginRegisterErrorMessage = message;
    notifyListeners();
  }

  void login({required String email, required String password}) {
    if(loginRegisterInfo.buttonLoginRegisterEnabled) {
      authService.signInWithEmailAndPassword(email: email, password: password)
        .then((user) => user)
        .onError((error, stackTrace) {
          showLoginErrorWithMessage(message: '$error');
        });
    }
  }
}