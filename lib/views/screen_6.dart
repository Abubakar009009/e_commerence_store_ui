import 'package:e_commerence_store_ui/utils/app_assets.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/views/screen_6widets.dart/otp_container.dart';
import 'package:e_commerence_store_ui/views/screen_7.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_strings.dart';
import '../utils/media_query.dart';
import '../widgets/back_custom.dart';
import '../widgets/custom_bottom_buttons.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(
                top: GetScreenSize.getScreenWidth(context) * 0.17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackCustom(),
                Padding(
                  padding: EdgeInsets.only(
                      top: GetScreenSize.getScreenWidth(context) * 0.05,
                      left: GetScreenSize.getScreenWidth(context) * 0.1,
                      right: GetScreenSize.getScreenWidth(context) * 0.1),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        AppStrings.forgotPassword,
                        style: TextStyle(
                            fontSize:
                                GetScreenSize.getScreenWidth(context) * 0.075,
                            fontWeight: FontWeight.w600),
                      )),
                      SizedBox(
                        height: GetScreenSize.getScreenWidth(context) * 0.1,
                      ),
                      Image.asset(
                        AppAssets.forgotscreen,
                        height: GetScreenSize.getScreenWidth(context) * 0.5,
                        width: GetScreenSize.getScreenWidth(context) * 0.8,
                      ),
                      SizedBox(
                        height: GetScreenSize.getScreenWidth(context) * 0.1,
                      ),
                      Form(
                        child: Row(
                          children: [
                            const OtpContainer(),
                            SizedBox(
                              width:
                                  GetScreenSize.getScreenWidth(context) * 0.05,
                            ),
                            const OtpContainer(),
                            SizedBox(
                              width:
                                  GetScreenSize.getScreenWidth(context) * 0.05,
                            ),
                            const OtpContainer(),
                            SizedBox(
                              width:
                                  GetScreenSize.getScreenWidth(context) * 0.05,
                            ),
                            Container(
                              width:
                                  GetScreenSize.getScreenWidth(context) * 0.15,
                              height:
                                  GetScreenSize.getScreenWidth(context) * 0.19,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.appBlackText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors
                                    .AppWhiteColor, // Set the default box color here
                              ),
                              child: SizedBox(
                                height: GetScreenSize.getScreenWidth(context) *
                                    0.15,
                                width: GetScreenSize.getScreenWidth(context) *
                                    0.15,
                                child: TextFormField(
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  cursorHeight: 30,
                                  decoration: InputDecoration(
                                    border: InputBorder
                                        .none, // Hide the default underline
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors
                                            .appBlackText, // Set the border color when focused
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: GetScreenSize.getScreenWidth(context) * 0.45,
                      ),
                      RichText(
                        text: TextSpan(
                          text: AppStrings.timer,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.appBlackText,

                            // Other properties you want to customize
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: AppStrings.confirmation,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                // fontWeight: FontWeight.bold,
                                color: AppColors.appGreyText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: CustomBottomButton(
          onTab: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Screen7()));
          },
          text: AppStrings.confirmcode),
    );
  }
}
