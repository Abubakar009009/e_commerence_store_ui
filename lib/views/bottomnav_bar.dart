// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors

import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/views/screen_12.dart';
import 'package:e_commerence_store_ui/views/screen_15.dart';
import 'package:e_commerence_store_ui/views/screen_17_drawer.dart';
import 'package:e_commerence_store_ui/views/screen_19.dart';
import 'package:e_commerence_store_ui/views/screen_8.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    const Screen8(),
    const Screen19(),
    const Screen15(),
    const Screen12(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
        drawer: const Screen17Drawer(),
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
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Do you want to close App'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('No')),
            ],
          );
        });
    return exitApp;
  }
}
