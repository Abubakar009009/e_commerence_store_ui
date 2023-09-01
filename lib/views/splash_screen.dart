import 'dart:async';

import 'package:e_commerence_store_ui/utils/app_assets.dart';
import 'package:e_commerence_store_ui/views/screen_1.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  _startTimer() async {
    // Simulate a delay using a Timer
    Timer(const Duration(seconds: 3), () {
      // After 3 seconds, navigate to the login page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Screen1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppAssets.splashscreen,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ), // Path to your splash image
      ),
    );
  }
}
