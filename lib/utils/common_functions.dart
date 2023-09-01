import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:flutter/material.dart';

class CommonFunctions {
  static bool checkLogin(BuildContext context) {
    if (AppConstants.password && AppConstants.username) {
      AppConstants.password = false;
      AppConstants.username = false;
      print(AppConstants.passwordGiven);
      print(AppConstants.usernameGiven);
      // AppConstants.emailGiven = null;
      AppConstants.passwordGiven = null;
      AppConstants.usernameGiven = null;
      // print('success');
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(' Please enter correct data'),
        duration: Duration(seconds: 3),
      ),
    );

    print('faliyer');
    return false;
  }

  static bool checkSignup(BuildContext context) {
    if (AppConstants.password && AppConstants.username && AppConstants.email) {
      AppConstants.password = false;
      AppConstants.username = false;
      AppConstants.email = false;
      print(AppConstants.emailGiven);
      print(AppConstants.passwordGiven);
      print(AppConstants.usernameGiven);
      AppConstants.emailGiven = null;
      AppConstants.passwordGiven = null;
      AppConstants.usernameGiven = null;

      print('success');
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(' Please enter correct data'),
        duration: Duration(seconds: 3),
      ),
    );

    print('faliuer of signup ');
    return false;
  }
}
