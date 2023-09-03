// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors

import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/views/screen_12.dart';
import 'package:e_commerence_store_ui/views/screen_15.dart';
import 'package:e_commerence_store_ui/views/screen_19.dart';
import 'package:e_commerence_store_ui/views/screen_8.dart';
import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite')),
      body: const Center(child: Text('Favorite Screen')),
    );
  }
}

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: const Center(child: Text('Wallet Screen')),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: const Center(child: Text('Cart Screen')),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    const Screen8(),
    Screen19(),
    Screen15(),
    Screen12(listofproducts: AppConstants.productsList),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.appPurpleColor,
        unselectedItemColor: AppColors.appGreyBackground,
        onTap: _onItemTapped,
      ),
    );
  }
}