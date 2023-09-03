import 'package:e_commerence_store_ui/utils/common_functions.dart';
import 'package:e_commerence_store_ui/views/screen_13.dart/textfield.dart';
import 'package:e_commerence_store_ui/views/screen_14.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/media_query.dart';
import '../../widgets/back_custom_middle.dart';
import '../../widgets/custom_bottom_buttons.dart';

class Screen13 extends StatefulWidget {
  const Screen13({super.key});

  @override
  State<Screen13> createState() => _Screen13State();
}

class _Screen13State extends State<Screen13> {
  bool forIos = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                    AppStrings.address,
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
              TextFieldCustom(
                width: GetScreenSize.getScreenWidth(context) * 0.9,
                hintText: AppStrings.namehint,
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
                        AppStrings.country,
                        style: TextStyle(
                            fontSize:
                                GetScreenSize.getScreenWidth(context) * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: GetScreenSize.getScreenWidth(context) * 0.05,
                      ),
                      TextFieldCustom(
                        width: GetScreenSize.getScreenWidth(context) * 0.4,
                        hintText: AppStrings.countryhint,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.city,
                        style: TextStyle(
                            fontSize:
                                GetScreenSize.getScreenWidth(context) * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: GetScreenSize.getScreenWidth(context) * 0.05,
                      ),
                      TextFieldCustom(
                        width: GetScreenSize.getScreenWidth(context) * 0.4,
                        hintText: AppStrings.cityName,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Text(
                AppStrings.phoneNumber,
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              TextFieldCustom(
                  width: GetScreenSize.getScreenWidth(context) * 0.9,
                  hintText: AppStrings.phoneNumberHint),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Text(
                AppStrings.address,
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              TextFieldCustom(
                  width: GetScreenSize.getScreenWidth(context) * 0.9,
                  hintText: AppStrings.addressText),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.saveAsPrimary,
                    style: TextStyle(
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                        fontWeight: FontWeight.w500),
                  ),
                  CupertinoSwitch(
                    activeColor: AppColors.switchGreen,
                    thumbColor: AppColors.AppWhiteColor,
                    trackColor: AppColors.appGreyBackground,
                    value: forIos,
                    onChanged: (value) => setState(() => forIos = value),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomButton(
          onTab: () {
            CommonFunctions.addressAdded(context);

            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Screen14()));
          },
          text: AppStrings.saveAddress),
    );
  }
}
