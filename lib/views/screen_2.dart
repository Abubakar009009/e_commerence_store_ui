import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/views/screen_4.dart';
import 'package:e_commerence_store_ui/widgets/custom_bottom_buttons.dart';
import 'package:e_commerence_store_ui/views/screen_3.dart';
import 'package:e_commerence_store_ui/widgets/back_custom.dart';
import 'package:e_commerence_store_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/media_query.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.AppWhiteColor,
      body: Padding(
        padding:
            EdgeInsets.only(top: GetScreenSize.getScreenWidth(context) * 0.17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackCustom(),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              child: Center(
                  child: Text(
                AppStrings.getStarted,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextButton(
                      onTab: () {},
                      buttonText: AppStrings.facebook,
                      buttonColor: AppColors.facebookButton,
                      radius: 15,
                      fontSize: 17,
                      fontColor: AppColors.AppWhiteColor,
                      addIcon: true,
                      icon: const FaIcon(FontAwesomeIcons.facebook),
                      height: MediaQuery.of(context).size.height * 0.070,
                    ),
                    CustomTextButton(
                      onTab: () {},
                      buttonText: AppStrings.twitter,
                      buttonColor: AppColors.twitterButton,
                      radius: 15,
                      fontSize: 17,
                      fontColor: AppColors.AppWhiteColor,
                      addIcon: true,
                      icon: const FaIcon(FontAwesomeIcons.twitter),
                      height: MediaQuery.of(context).size.height * 0.070,
                    ),
                    CustomTextButton(
                      onTab: () {},
                      buttonText: AppStrings.google,
                      buttonColor: AppColors.googleButton,
                      radius: 15,
                      fontSize: 17,
                      fontColor: AppColors.AppWhiteColor,
                      height: MediaQuery.of(context).size.height * 0.070,
                      addIcon: true,
                      icon: const FaIcon(FontAwesomeIcons.google),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Screen4()));
                },
                child: RichText(
                  text: TextSpan(
                    text: AppStrings.alreadyAccount,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.appGreyText,

                      // Other properties you want to customize
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppStrings.signIn,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.appBlackText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomButton(
        text: AppStrings.createAnAccount,
        onTab: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Screen3()));
        },
      ),
    );
  }
}
