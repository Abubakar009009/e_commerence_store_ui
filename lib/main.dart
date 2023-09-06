import 'package:e_commerence_store_ui/firebase_options.dart';
import 'package:e_commerence_store_ui/providers/login_signup_state_provider.dart';
import 'package:e_commerence_store_ui/providers/product_details_provider.dart';
import 'package:e_commerence_store_ui/providers/signup_provider.dart';
import 'package:e_commerence_store_ui/views/add_data_screen.dart';
import 'package:e_commerence_store_ui/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignupProvider()),
        ChangeNotifierProvider(create: (context) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (context) => LoginSignupStateProvider()),
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
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Inter',
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
