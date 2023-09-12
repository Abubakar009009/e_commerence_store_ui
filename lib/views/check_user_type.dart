// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:e_commerence_store_ui/views/bottomnav_bar.dart';
import 'package:e_commerence_store_ui/views/screen_1.dart';
import 'package:e_commerence_store_ui/views/screen_3.dart';
import 'package:e_commerence_store_ui/views/screen_4.dart';
import 'package:e_commerence_store_ui/views/splash_screen.dart';
import 'package:e_commerence_store_ui/views/splash_screen_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firebase_admin/get_all_admin_data.dart';
import '../providers/add_to_cart_provider.dart';
import '../services/get_data.dart';
import '../services/send_brand.dart';
import '../services/send_order.dart';
import '../services/wishlist_data.dart';
import '../utils/app_constants_admin.dart';
import '../utils/common_functions.dart';
import 'admin_show_orders.dart';

class CheckUserType extends StatefulWidget {
  const CheckUserType({Key? key}) : super(key: key);

  @override
  _CheckUserTypeState createState() => _CheckUserTypeState();
}

class _CheckUserTypeState extends State<CheckUserType> {
  final GetData getData = GetData();
  @override
  void initState() {
    super.initState();
    checkUserStatus(context);
  }

  Future<void> _startTimer() async {
    await _fetchData();

    await SendOrder.getOrders();

    await CommonFunctions.getCartProducts(context);
    await WishlistData.initializeWishlist();
    context.read<AddtocartProvider>().initializeList();
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

  Future<void> startTimer_admin() async {
    await fetchData_admin();
    await fetchOrder_admin();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AdminShowOrder()));
  }

  Future<void> fetchData_admin() async {
    try {
      AppConstantsAdmin.productsList = await getData.getDataFromFirebase();
    } catch (e) {
      // Handle any errors that occur during data fetching.
      print('Error fetching data: $e');
    }
  }

  Future<void> fetchOrder_admin() async {
    try {
      AppConstantsAdmin.orders = await GetDataAdmin.getAllOrders();
      print(AppConstantsAdmin.orderUsers.length);
    } catch (e) {
      // Handle any errors that occur during data fetching.
      print('Error fetching data: $e');
    }
  }

  Future<void> checkUserStatus(BuildContext context) async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is logged in, let's fetch their data from Firestore

      final CollectionReference ordersCollection =
          FirebaseFirestore.instance.collection('signupdata');
      final QuerySnapshot userSnapshot =
          await ordersCollection.where('uid', isEqualTo: user.uid).get();

      if (userSnapshot.docs.isNotEmpty) {
        final userData = userSnapshot.docs.first.data() as Map<String, dynamic>;
        final userType = userData['user_type'] as String;

        if (userType == 'admin') {
          await startTimer_admin();
          // User is an admin, navigate to SplashScreen1
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AdminShowOrder()));
        } else {
          await _startTimer();
          // User is not an admin, navigate to SplashScreen
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => BottomNavBar()));
        }
      } else {
        // User document doesn't exist, handle accordingly
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SplashScreen()));
      }
    } else {
      print('control comes here');
      // User is not logged in, navigate to Screen4
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SplashScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
