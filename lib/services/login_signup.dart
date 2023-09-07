// ignore_for_file: use_build_context_synchronously

import 'package:e_commerence_store_ui/providers/login_signup_state_provider.dart';
import 'package:e_commerence_store_ui/views/bottomnav_bar.dart';
import 'package:e_commerence_store_ui/views/screen_4.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginSignup {
  Future<User?> signUp(
      BuildContext context, String email, String password) async {
    try {
      context.read<LoginSignupStateProvider>().signup();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      // ignore: prefer_const_constructors

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Screen4()));
      context.read<LoginSignupStateProvider>().signupDone();

      return user;
    } catch (e) {
      context.read<LoginSignupStateProvider>().logginDone();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This Email already exists please Login'),
          duration: Duration(seconds: 3),
        ),
      );
      // print("Error during sign-up: $e");
      return null;
    }
  }

  Future<User?> signIn(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      print('-------------------------------signin done');
      context.read<LoginSignupStateProvider>().logginDone();
      return user;
    } catch (e) {
      context.read<LoginSignupStateProvider>().logginDone();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error! Email and Password incorrect'),
          duration: Duration(seconds: 3),
        ),
      );
      print("Error during sign-in: $e");
      return null;
    }
  }
}
