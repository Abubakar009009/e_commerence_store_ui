// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerence_store_ui/providers/login_signup_state_provider.dart';
import 'package:e_commerence_store_ui/views/bottomnav_bar.dart';
import 'package:e_commerence_store_ui/views/screen_4.dart';
import 'package:e_commerence_store_ui/views/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views/check_user_type.dart';

class LoginSignup {
  Future<User?> signUp(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      context.read<LoginSignupStateProvider>().signup();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      // Create a reference to the "signupdata" collection
      CollectionReference signupDataCollection =
          FirebaseFirestore.instance.collection('signupdata');

      // Add a new document with a random auto-generated ID
      DocumentReference newDocumentRef = await signupDataCollection.add({
        'email': email,
        'password': password,
        'uid': user!.uid,
        'user_type': 'User'
      });

      // Use the ID of the newly created document if needed
      String documentId = newDocumentRef.id;

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Screen4()));
      context.read<LoginSignupStateProvider>().signupDone();

      return user;
    } catch (e) {
      context.read<LoginSignupStateProvider>().signupDone();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This Email already exists please Login'),
          duration: Duration(seconds: 3),
        ),
      );
      return null;
    }
  }

  Future<User?> signIn(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //  print('----------------error');
      User? user = userCredential.user;

      //  print('-------------------------------signin done');

      return user;
    } catch (e) {
      print('there is an exception');
      print(e);
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
