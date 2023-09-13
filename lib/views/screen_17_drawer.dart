import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:e_commerence_store_ui/views/orders_screen/order_screen.dart';
import 'package:e_commerence_store_ui/views/screen_14.dart';
import 'package:e_commerence_store_ui/views/screen_19.dart';
import 'package:e_commerence_store_ui/views/splash_screen.dart';
import 'package:e_commerence_store_ui/widgets/custom_button.dart';
import 'package:e_commerence_store_ui/widgets/drawer_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class Screen17Drawer extends StatefulWidget {
  const Screen17Drawer({super.key});

  @override
  State<Screen17Drawer> createState() => _Screen17DrawerState();
}

class _Screen17DrawerState extends State<Screen17Drawer> {
  bool forIos = false;

  Future<bool?> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog and return false (user canceled)
                Navigator.of(context).pop(false);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog and return true (user confirmed)
                Navigator.of(context).pop(true);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: Border.all(color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.AppWhiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AppAssets.drawerMenu),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: AssetImage(AppAssets.drawerImage),
                radius: 20, // Adjust the radius as needed
              ),
              title: Text(
                AppStrings.namehint,
                textScaleFactor: 1,
                style: TextStyle(
                  color: AppColors.appBlackText,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: CustomTextButton(
                onTab: () {},
                buttonText: AppStrings.orders,
                buttonColor: AppColors.appGreyBackground,
                fontColor: AppColors.appGreyText,
                radius: 5,
                fontSize: 12,
                width: 66,
                height: 32,
              ),
              subtitle: Row(
                children: [
                  Text(
                    AppStrings.verifiedProfile,
                    style: TextStyle(
                      color: AppColors.appGreyText,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.verified,
                    size: 13,
                    color: AppColors.greenTick,
                  ),
                ],
              ),
              selected: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AppAssets.drawerSun, height: 25),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppStrings.darkMode,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                CupertinoSwitch(
                  activeColor: AppColors.switchGreen,
                  thumbColor: AppColors.AppWhiteColor,
                  trackColor: AppColors.appGreyBackground,
                  value: forIos,
                  onChanged: (value) => setState(() => forIos = value),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Image.asset(AppAssets.drawerinfo, height: 25),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppStrings.accountInfo,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DrawerRow(
                imagelink: AppAssets.drawerLock,
                text: AppStrings.passwordheading),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Close the drawer
                Navigator.of(context).pop();

                // Navigate to Screen16
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrdersScreen(
                            objects: AppConstants.getDataList,
                          )),
                );
              },
              child: DrawerRow(
                  imagelink: AppAssets.drawerbag, text: AppStrings.orderInfo),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Close the drawer
                Navigator.of(context).pop();

                // Navigate to Screen16
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen14()),
                );
              },
              child: DrawerRow(
                  imagelink: AppAssets.drawerWallet,
                  text: AppStrings.cardsInfo),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Close the drawer
                Navigator.of(context).pop();

                // Navigate to Screen16
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen19()),
                );
              },
              child: DrawerRow(
                  imagelink: AppAssets.drawerHeart,
                  text: AppStrings.wishlistInfo),
            ),
            const SizedBox(
              height: 20,
            ),
            DrawerRow(
                imagelink: AppAssets.drawerSettings,
                text: AppStrings.settingsInfo),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                // Show a confirmation dialog
                bool logoutConfirmed =
                    await _showLogoutConfirmationDialog(context) ?? false;

                // Check if the user confirmed the logout
                if (logoutConfirmed) {
                  // Perform Firebase logout
                  try {
                    await FirebaseAuth.instance.signOut();
                  } catch (e) {
                    print('Error during logout: $e');
                  }

                  // Navigate to SplashScreen and replace all existing routes
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) =>
                          SplashScreen(), // Replace with your desired screen
                    ),
                    (route) => false, // Pop all existing routes from the stack
                  );
                }
              },
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.drawerLogout,
                    height: 25,
                    color: AppColors.redText,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppStrings.logoutInfo,
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.redText,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
