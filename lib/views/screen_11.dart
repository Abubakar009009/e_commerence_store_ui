import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/utils/common_functions.dart';
import 'package:e_commerence_store_ui/views/screen_12.dart';
import 'package:e_commerence_store_ui/widgets/custom_bottom_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/media_query.dart';
import '../widgets/back_custom_middle.dart';

class Screen11 extends StatefulWidget {
  const Screen11({super.key});

  @override
  State<Screen11> createState() => _Screen11State();
}

class _Screen11State extends State<Screen11> {
  double _currentvalue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            top: GetScreenSize.getScreenWidth(context) * 0.17,
            left: GetScreenSize.getScreenWidth(context) * 0.05,
            right: GetScreenSize.getScreenWidth(context) * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const BackCustomMiddle(),
                  const Expanded(child: SizedBox()),
                  Text(
                    AppStrings.addReviewButton,
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.060,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.arrow_back,
                    color: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Text(
                AppStrings.name01,
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Container(
                  height: 60,
                  width: GetScreenSize.getScreenWidth(context) * 0.9,
                  decoration: BoxDecoration(
                      color: AppColors.appGreyBackground,
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: TextField(
                      style: TextStyle(color: AppColors.appBlackText),
                      decoration: InputDecoration(
                        hintText: AppStrings.nameHint, // Placeholder text
                        hintStyle: TextStyle(color: AppColors.appGreyText),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none, // No border when focused
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide.none, // No border when not focused
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Text(
                AppStrings.reviewText,
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Container(
                height: 250,
                width: GetScreenSize.getScreenWidth(context) * 0.9,
                decoration: BoxDecoration(
                    color: AppColors.appGreyBackground,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    maxLines: 20,
                    style: TextStyle(
                        color: AppColors.appBlackText), // Set the text color
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none, // No border when focused
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide.none, // No border when not focused
                      ),
                      hintText: AppStrings.reviewHint, // Placeholder text
                      hintStyle: TextStyle(color: AppColors.appGreyText),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Text(
                AppStrings.starText,
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Text(
                    AppStrings.minStarValue,
                    style: TextStyle(
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                        fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: Slider(
                        value: _currentvalue,
                        onChanged: (value) {
                          setState(() {
                            _currentvalue = value;
                          });
                        }),
                  ),
                  Text(
                    AppStrings.maxStarValue,
                    style: TextStyle(
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: CustomBottomButton(
          onTab: () {
            CommonFunctions.reviewAdded(context);
          },
          text: AppStrings.submitReview),
    );
  }
}
