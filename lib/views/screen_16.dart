import 'package:e_commerence_store_ui/utils/media_query.dart';
import 'package:e_commerence_store_ui/widgets/custom_bottom_buttons.dart';
import 'package:e_commerence_store_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/back_custom_middle.dart';

class Screen16 extends StatelessWidget {
  const Screen16({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: GetScreenSize.getScreenWidth(context) * 0.17,
            left: GetScreenSize.getScreenWidth(context) * 0.05,
            right: GetScreenSize.getScreenWidth(context) * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackCustomMiddle(),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.2,
              ),
              Center(child: Image.asset('assets/images/Group 2.png')),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.1,
              ),
              Center(
                child: Text(
                  'Order Confirmed!',
                  style: TextStyle(
                    color: AppColors.appBlackText,
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.060,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Center(
                child: Text(
                  'Your order has been confirmed, we will send you confirmation email shortly.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.appGreyText,
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.040,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.15,
              ),
              CustomTextButton(
                  onTab: () {},
                  buttonText: 'Go to Orders',
                  buttonColor: AppColors.appGreyBackground,
                  height: GetScreenSize.getScreenWidth(context) * 0.13,
                  radius: 10,
                  fontColor: AppColors.appGreyText,
                  fontSize: GetScreenSize.getScreenWidth(context) * 0.050)
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          CustomButtomButton(onTab: () {}, text: 'Continue Shopping'),
    );
  }
}
