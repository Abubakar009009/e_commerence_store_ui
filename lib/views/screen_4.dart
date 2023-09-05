import 'package:e_commerence_store_ui/providers/login_signup_state_provider.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/media_query.dart';
import 'package:e_commerence_store_ui/views/bottomnav_bar.dart';
import 'package:e_commerence_store_ui/views/screen_5.dart';
import 'package:e_commerence_store_ui/widgets/custom_bottom_buttons.dart';
import 'package:e_commerence_store_ui/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_strings.dart';
import '../utils/common_functions.dart';
import '../widgets/back_custom.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  bool forIos = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: GetScreenSize.getScreenWidth(context) * 0.17,
                ),
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
                          Column(
                            children: [
                              Center(
                                  child: Text(
                                AppStrings.welcome,
                                style: TextStyle(
                                    fontSize:
                                        GetScreenSize.getScreenWidth(context) *
                                            0.075,
                                    fontWeight: FontWeight.w600),
                              )),
                              Center(
                                  child: Text(
                                AppStrings.enterData,
                                style: TextStyle(
                                    fontSize:
                                        GetScreenSize.getScreenWidth(context) *
                                            0.04,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.appGreyText),
                              )),
                            ],
                          ),
                          SizedBox(
                            height:
                                GetScreenSize.getScreenWidth(context) * 0.21,
                          ),
                          CustomTextField(
                              heading: AppStrings.emailheading,
                              fieldType: TextFieldType.Email,
                              hinttext: AppStrings.emailhint),
                          SizedBox(
                            height:
                                GetScreenSize.getScreenWidth(context) * 0.10,
                          ),
                          CustomTextField(
                              heading: AppStrings.passwordheading,
                              fieldType: TextFieldType.Password,
                              hinttext: AppStrings.passwordhint),
                          SizedBox(
                            height:
                                GetScreenSize.getScreenWidth(context) * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Screen5()));
                                },
                                child: Text(
                                  AppStrings.forgotPassword,
                                  style: TextStyle(
                                      fontSize: GetScreenSize.getScreenWidth(
                                              context) *
                                          0.04,
                                      color: AppColors.redText),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height:
                                GetScreenSize.getScreenWidth(context) * 0.08,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.rememberMe,
                                style: TextStyle(
                                    fontSize:
                                        GetScreenSize.getScreenWidth(context) *
                                            0.04,
                                    fontWeight: FontWeight.w500),
                              ),
                              CupertinoSwitch(
                                activeColor: AppColors.switchGreen,
                                thumbColor: AppColors.AppWhiteColor,
                                trackColor: AppColors.appGreyBackground,
                                value: forIos,
                                onChanged: (value) =>
                                    setState(() => forIos = value),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                GetScreenSize.getScreenWidth(context) * 0.25,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: AppStrings.agree,
                              style: TextStyle(
                                fontSize:
                                    GetScreenSize.getScreenWidth(context) *
                                        0.035,
                                color: AppColors.appGreyText,

                                // Other properties you want to customize
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: AppStrings.termsandConditions,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.appBlackText,
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
            bottomNavigationBar: CustomBottomButton(
                onTab: () {
                  context.read<LoginSignupStateProvider>().logginIn();
                  final obj = CommonFunctions();
                  if (obj.checkLogin(context)) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar()));
                  }
                },
                text: AppStrings.login),
          ),
        ),
        if (context.watch<LoginSignupStateProvider>().isLoggedIn)
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: const Center(child: CircularProgressIndicator()),
          )
      ],
    );
  }
}
