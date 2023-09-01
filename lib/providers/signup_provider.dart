import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  String? _usernameError;
  bool _usernameFine = false;

  String? _emailError;
  bool _emailFine = false;

  String? get usernameError => _usernameError;
  bool get usernameFine => _usernameFine;

  String? get emailError => _emailError;
  bool get emailFine => _emailFine;

  void validateUsername(String username) {
    if (username.length < 5) {
      _usernameError = 'Username must be at least 5 characters long';
      _usernameFine = false;
    } else {
      _usernameFine = true;
      _usernameError = null;
    }
    notifyListeners();
  }

  void validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(email)) {
      _emailError = 'Invalid email format';
      _emailFine = false;
    } else {
      _emailFine = true;
      _emailError = null;
    }
    notifyListeners();
  }

  bool checklogin() {
    return true;
  }
}
