// ignore_for_file: avoid_print

import 'package:another_flushbar/flushbar.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_signup_state_provider.dart';
import '../services/login_signup.dart';

class CommonFunctions {
  final obj = LoginSignup();
  bool checkSignup(BuildContext context) {
    if (AppConstants.password && AppConstants.username) {
      AppConstants.password = false;
      AppConstants.username = false;

      print(AppConstants.passwordGiven);
      print(AppConstants.usernameGiven);
      // AppConstants.emailGiven = null;

      obj.signUp(context, AppConstants.emailGiven, AppConstants.passwordGiven);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid data. Please check your input.'),
          duration: Duration(seconds: 3),
        ),
      );
    }

    return false;
  }

  bool checkLogin(BuildContext context) {
    if (AppConstants.password && AppConstants.email) {
      AppConstants.password = false;
      // AppConstants.username = false;
      AppConstants.email = false;
      print(AppConstants.emailGiven);
      print(AppConstants.passwordGiven);
      print(AppConstants.usernameGiven);

      obj.signIn(context, AppConstants.emailGiven, AppConstants.passwordGiven);
      // context.read<LoginSignupStateProvider>().logginDone();
    } else {
      context.read<LoginSignupStateProvider>().logginDone();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid data. Please check your input.'),
          duration: Duration(seconds: 3),
        ),
      );
    }

    return false;
  }

  static void showAddToCart(BuildContext context) {
    Flushbar(
      title: "Added to Cart",
      message: "The product has been added to your cart.",
      duration: Duration(seconds: 4),
      flushbarPosition: FlushbarPosition.TOP, // Show from the top
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
      backgroundColor: AppColors.greenTick,
      mainButton: TextButton(
        onPressed: () {
          Navigator.of(context).pop(); // Close the Flushbar
          // Add logic to navigate to the cart screen
        },
        child: Text(
          "View Cart",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ).show(context);
  }

  static void reviewAdded(BuildContext context) {
    Flushbar(
      title: "Review Submitted",
      message: "Your review has been Successfully submited.",
      duration: Duration(seconds: 4),
      flushbarPosition: FlushbarPosition.TOP, // Show from the top
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
      backgroundColor: AppColors.greenTick,
    ).show(context);
  }

  static void addressAdded(BuildContext context) {
    Flushbar(
      title: "Address Changed",
      message: "Your address has been Successfully changed.",
      duration: Duration(seconds: 4),
      flushbarPosition: FlushbarPosition.TOP, // Show from the top
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
      backgroundColor: AppColors.greenTick,
    ).show(context);
  }

  static void cardAdded(BuildContext context) {
    Flushbar(
      title: "Card Saved",
      message: "Your card details has been Successfully saved.",
      duration: Duration(seconds: 4),
      flushbarPosition: FlushbarPosition.TOP, // Show from the top
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
      backgroundColor: AppColors.greenTick,
    ).show(context);
  }
}
