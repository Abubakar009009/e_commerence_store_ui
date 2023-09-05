import 'package:e_commerence_store_ui/utils/app_assets.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/views/screen_6.dart';
import 'package:e_commerence_store_ui/widgets/custom_bottom_buttons.dart';
import 'package:e_commerence_store_ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../utils/media_query.dart';
import '../widgets/back_custom.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
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
                              color: AppColors.appBlackText,
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
                        CustomTextField(
                            heading: AppStrings.emailheading,
                            fieldType: TextFieldType.Email,
                            hinttext: AppStrings.emailhint),
                        SizedBox(
                          height: GetScreenSize.getScreenWidth(context) * 0.3,
                        ),
                        Text(
                          AppStrings.emailValidation,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.appGreyText),
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
                  MaterialPageRoute(builder: (context) => const Screen6()));
            },
            text: AppStrings.confirmmail),
      ),
    );
  }
}
