import 'package:e_commerence_store_ui/utils/app_assets.dart';
import 'package:e_commerence_store_ui/views/splash_screen.dart';
import 'package:flutter/material.dart';

class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({super.key});

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay navigation by 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to your main app screen here
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
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
        ),
      ),
    );
  }
}

// Define YourMainAppScreen widget for navigation
