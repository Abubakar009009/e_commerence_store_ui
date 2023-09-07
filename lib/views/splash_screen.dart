// import 'dart:async';

// import 'package:e_commerence_store_ui/services/send_brand.dart';
// import 'package:e_commerence_store_ui/utils/app_assets.dart';
// import 'package:e_commerence_store_ui/utils/app_constants.dart';
// import 'package:e_commerence_store_ui/views/bottomnav_bar.dart';
// import 'package:e_commerence_store_ui/views/screen_1.dart';
// import 'package:e_commerence_store_ui/views/screen_8.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../models/products_model.dart';
// import '../services/get_data.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   final GetData getData = GetData();
//   @override
//   void initState() {
//     SendBrand.addBrand('Adidas', 'https://ibb.co/Wv1HxWv');
//     SendBrand.addBrand('Nike', 'https://ibb.co/V9XSrJs');
//     SendBrand.addBrand('Fila', 'https://ibb.co/Y2c9zM8');

//     super.initState();
//     _startTimer();

//   }
//    _startTimer() async {
//     // Simulate a delay using a Timer
//      await _fetchData();
//       final User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         // User is logged in, navigate to Screen8.
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => BottomNavBar()),
//         );
//       } else {
//         // User is not logged in, navigate to Screen1.
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => const Screen1()),
//         );
//       }

//   }

//   void _fetchData() async {
//     try {
//       AppConstants.getDataList = await getData.getDataFromFirebase();
//       // Now you have the productsList, you can use it as needed.
//     } catch (e) {
//       // Handle any errors that occur during data fetching.
//       print('Error fetching data: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset(
//           AppAssets.splashscreen,
//           width: double.infinity,
//           fit: BoxFit.fitWidth,
//         ), // Path to your splash image
//       ),
//     );
//   }
// }

import 'package:e_commerence_store_ui/views/bottomnav_bar.dart';
import 'package:e_commerence_store_ui/views/screen_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/get_data.dart';
import '../services/send_brand.dart';
import '../utils/app_assets.dart';
import '../utils/app_constants.dart';

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
  }

  Future<void> _startTimer() async {
    await _fetchData();
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is logged in, navigate to Screen8.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
    } else {
      // User is not logged in, navigate to Screen1.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Screen1()),
      );
    }
  }

  Future<void> _fetchData() async {
    try {
      AppConstants.getDataList = await getData.getDataFromFirebase();
      AppConstants.brandList = await SendBrand.getBrandsFromFirebase();
      // Now you have the productsList, you can use it as needed.
    } catch (e) {
      // Handle any errors that occur during data fetching.
      print('Error fetching data: $e');
    }
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
