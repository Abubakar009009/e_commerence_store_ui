// ignore_for_file: non_constant_identifier_names

import 'package:e_commerence_store_ui/firebase_admin/get_all_admin_data.dart';
import 'package:e_commerence_store_ui/models/cart_product_model.dart';
import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:e_commerence_store_ui/services/add_to_cart.dart';
import 'package:e_commerence_store_ui/services/send_order.dart';
import 'package:e_commerence_store_ui/services/wishlist_data.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:e_commerence_store_ui/utils/app_constants_admin.dart';
import 'package:e_commerence_store_ui/utils/common_functions.dart';
import 'package:e_commerence_store_ui/views/admin_show_orders.dart';
import 'package:e_commerence_store_ui/views/bottomnav_bar.dart';
import 'package:e_commerence_store_ui/views/screen_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/add_to_cart_provider.dart';
import '../utils/app_assets.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  final GetDataAdmin getData = GetDataAdmin();

  @override
  void initState() {
    super.initState();
    // startTimer_admin();
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
