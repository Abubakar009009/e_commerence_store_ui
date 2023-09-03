import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTab;
  const CustomBottomButton(
      {required this.onTab, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.appPurpleColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            )),
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
