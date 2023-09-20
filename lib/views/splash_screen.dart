// ignore_for_file: use_build_context_synchronously

import 'package:e_commerence_store_ui/views/check_user_type.dart';
import 'package:e_commerence_store_ui/views/no_internet.dart';
import 'package:e_commerence_store_ui/views/gender_selection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../services/get_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GetData getData = GetData();

  @override
  void initState() {
    super.initState();
    checkConnectivityAndNavigate();
  }

  Future<void> checkConnectivityAndNavigate() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    final User? user = FirebaseAuth.instance.currentUser;

    if (connectivityResult == ConnectivityResult.none) {
      // No internet connection, navigate to Screen20 or display an offline message.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NoInternet()),
      );
    } else {
      if (user != null) {
        // User is logged in, navigate to CheckUserType.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CheckUserType()),
        );
      } else {
        // User is not logged in, navigate to Screen4.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const GenderSelection()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
