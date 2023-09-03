import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/utils/common_functions.dart';
import 'package:e_commerence_store_ui/views/screen_13.dart/textfield.dart';
import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/media_query.dart';
import '../widgets/back_custom_middle.dart';
import '../widgets/custom_button.dart';

class Screen15 extends StatefulWidget {
  const Screen15({super.key});

  @override
  _Screen15State createState() => _Screen15State();
}

class _Screen15State extends State<Screen15> {
  int selectedContainerIndex = 0;
  void selectContainer(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const BackCustomMiddle(),
                  const Expanded(child: SizedBox()),
                  Text(
                    AppStrings.addNewCard,
                    style: TextStyle(
                      color: AppColors.appBlackText,
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.060,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectContainer(0); // Select the first container
                    },
                    child: Container(
                      height: GetScreenSize.getScreenWidth(context) * 0.13,
                      width: GetScreenSize.getScreenWidth(context) * 0.22,
                      decoration: BoxDecoration(
                        color: selectedContainerIndex == 0
                            ? AppColors
                                .orangeBorder // Yellow border if selected
                            : AppColors.appGreyBackground,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedContainerIndex == 0
                              ? AppColors.orangestar
                              : Colors.transparent,
                          width: selectedContainerIndex == 0 ? 1 : 0,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          AppAssets.visacardImage,
                          height: GetScreenSize.getScreenWidth(context) * 0.05,
                          width: GetScreenSize.getScreenWidth(context) * 0.12,
                          scale: 1,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectContainer(1); // Select the second container
                    },
                    child: Container(
                      height: GetScreenSize.getScreenWidth(context) * 0.13,
                      width: GetScreenSize.getScreenWidth(context) * 0.22,
                      decoration: BoxDecoration(
                        color: selectedContainerIndex == 1
                            ? AppColors
                                .orangeBorder // Yellow border if selected
                            : AppColors.appGreyBackground,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedContainerIndex == 1
                              ? AppColors.orangestar
                              : Colors.transparent,
                          width: selectedContainerIndex == 1 ? 1 : 0,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          AppAssets.visapImage,
                          height: GetScreenSize.getScreenWidth(context) * 0.05,
                          width: GetScreenSize.getScreenWidth(context) * 0.12,
                          scale: 1,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectContainer(2); // Select the third container
                    },
                    child: Container(
                      height: GetScreenSize.getScreenWidth(context) * 0.13,
                      width: GetScreenSize.getScreenWidth(context) * 0.22,
                      decoration: BoxDecoration(
                        color: selectedContainerIndex == 2
                            ? AppColors
                                .orangeBorder // Yellow border if selected
                            : AppColors.appGreyBackground,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedContainerIndex == 2
                              ? AppColors.orangestar
                              : Colors.transparent,
                          width: selectedContainerIndex == 2 ? 1 : 0,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          AppAssets.bankImage,
                          height: GetScreenSize.getScreenWidth(context) * 0.05,
                          width: GetScreenSize.getScreenWidth(context) * 0.12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.1,
              ),
              Text(
                AppStrings.cardOwner,
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.03,
              ),
              TextFieldCustom(
                width: GetScreenSize.getScreenWidth(context) * 0.9,
                hintText: AppStrings.namehint,
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Text(
                AppStrings.cardNumber,
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.03,
              ),
              TextFieldCustom(
                width: GetScreenSize.getScreenWidth(context) * 0.9,
                hintText: AppStrings.cardHint,
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.cardExpire,
                        style: TextStyle(
                            fontSize:
                                GetScreenSize.getScreenWidth(context) * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldCustom(
                        width: GetScreenSize.getScreenWidth(context) * 0.4,
                        hintText: AppStrings.cardExpireHint,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.cardCvv,
                        style: TextStyle(
                            fontSize:
                                GetScreenSize.getScreenWidth(context) * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldCustom(
                        width: GetScreenSize.getScreenWidth(context) * 0.4,
                        hintText: AppStrings.cardCvv,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              CustomTextButton(
                onTab: () {
                  CommonFunctions.cardAdded(context);
                },
                buttonText: 'Add Card',
                buttonColor: AppColors.appPurpleColor,
                radius: 15,
                fontSize: 17,
                fontColor: AppColors.AppWhiteColor,
                height: MediaQuery.of(context).size.height * 0.070,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
