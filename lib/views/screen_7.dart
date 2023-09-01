import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_strings.dart';
import '../utils/media_query.dart';
import '../widgets/back_custom.dart';
import '../widgets/custom_bottom_buttons.dart';
import '../widgets/custom_textfield.dart';
import 'bottomnav_bar.dart';

class Screen7 extends StatelessWidget {
  const Screen7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          //color: Colors.red,
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
                      Center(
                          child: Text(
                        AppStrings.newPassword,
                        style: TextStyle(
                            fontSize:
                                GetScreenSize.getScreenWidth(context) * 0.075,
                            fontWeight: FontWeight.w600),
                      )),
                      SizedBox(
                        height: GetScreenSize.getScreenWidth(context) * 0.21,
                      ),
                      CustomTextField(
                          heading: AppStrings.passwordheading,
                          fieldType: TextFieldType.Password,
                          hinttext: AppStrings.passwordhint),
                      SizedBox(
                        height: GetScreenSize.getScreenWidth(context) * 0.10,
                      ),
                      CustomTextField(
                          heading: 'Confirm Password',
                          fieldType: TextFieldType.Password,
                          hinttext: 'Confirm Password'),
                      SizedBox(
                        height: GetScreenSize.getScreenWidth(context) * 0.05,
                      ),
                      SizedBox(
                        height: GetScreenSize.getScreenWidth(context) * 0.08,
                      ),
                      SizedBox(
                        height: GetScreenSize.getScreenWidth(context) * 0.5,
                      ),
                      Text(
                        AppStrings.newPasswordtext,
                        style: TextStyle(
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.035,
                          color: AppColors.appGreyText,

                          // Other properties you want to customize
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: CustomButtomButton(
          onTab: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BottomNavBar()));
          },
          text: AppStrings.resetPassword),
    );
  }
}
