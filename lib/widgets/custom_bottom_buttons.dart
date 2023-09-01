import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTab;
  const CustomButtomButton(
      {required this.onTab, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        color: AppColors.appPurpleColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 17,
                    color: AppColors.AppWhiteColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
