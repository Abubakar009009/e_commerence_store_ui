import 'dart:async';

import 'package:e_commerence_store_ui/utils/app_assets.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:e_commerence_store_ui/views/screen_1.dart';
import 'package:flutter/material.dart';

import '../models/products_model.dart';
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
    _startTimer();
    _fetchData();
  }

  void _fetchData() async {
    try {
      AppConstants.getDataList = await getData.getDataFromFirebase();
      // Now you have the productsList, you can use it as needed.
    } catch (e) {
      // Handle any errors that occur during data fetching.
      print('Error fetching data: $e');
    }
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
