import 'package:e_commerence_store_ui/providers/product_details_provider.dart';
import 'package:e_commerence_store_ui/providers/signup_provider.dart';
import 'package:e_commerence_store_ui/views/bottomnav_bar.dart';
import 'package:e_commerence_store_ui/views/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // List of your providers
        ChangeNotifierProvider(create: (context) => SignupProvider()),
        ChangeNotifierProvider(create: (context) => ProductDetailsProvider()),

        // Add more providers if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Inter',
          ), // Use the same font family name here
        ),
      ),
      home: SplashScreen(),
    );
  }
}
