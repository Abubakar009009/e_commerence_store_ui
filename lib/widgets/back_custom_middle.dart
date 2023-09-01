import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BackCustomMiddle extends StatelessWidget {
  const BackCustomMiddle({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.AppWhiteColor,
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
