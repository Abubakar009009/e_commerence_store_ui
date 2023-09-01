import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BackCustom extends StatelessWidget {
  const BackCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
      child: GestureDetector(
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
      ),
    );
  }
}
