import 'package:flutter/material.dart';

class LoginSignupStateProvider extends ChangeNotifier {
  bool islogin = false;
  bool get isLoggedIn => islogin;
  bool issignup = false;
  bool get isSignup => issignup;
  void logginIn() {
    islogin = true;
    notifyListeners();
  }

  void logginDone() {
    islogin = false;
    notifyListeners();
  }

  void signup() {
    issignup = true;
    notifyListeners();
  }

  void signupDone() {
    issignup = false;
    notifyListeners();
  }
}
