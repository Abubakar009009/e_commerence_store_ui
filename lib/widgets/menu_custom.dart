import 'package:e_commerence_store_ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class MenuCustom extends StatelessWidget {
  const MenuCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.AppWhiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(AppAssets.menu),
        ),
      ),
    );
  }
}
