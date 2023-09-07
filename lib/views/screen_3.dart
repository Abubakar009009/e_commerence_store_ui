import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/utils/common_functions.dart';
import 'package:e_commerence_store_ui/utils/media_query.dart';
import 'package:e_commerence_store_ui/widgets/custom_bottom_buttons.dart';
import 'package:e_commerence_store_ui/widgets/back_custom.dart';
import 'package:e_commerence_store_ui/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_signup_state_provider.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
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
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                // color: Colors.amber,
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
                            top: GetScreenSize.getScreenWidth(context) * 0.05),
                        child: Center(
                            child: Text(
                          AppStrings.signUp,
                          style: TextStyle(
                              fontSize:
                                  GetScreenSize.getScreenWidth(context) * 0.075,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: GetScreenSize.getScreenWidth(context) * 0.1,
                            right: GetScreenSize.getScreenWidth(context) * 0.1,
                            top: GetScreenSize.getScreenWidth(context) * 0.08),
                        child: Container(
                          //color: Colors.red,
                          height: GetScreenSize.getScreenWidth(context) * 1.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomTextField(
                                  heading: AppStrings.usernameheading,
                                  fieldType: TextFieldType.Username,
                                  hinttext: AppStrings.usernamehint),
                              CustomTextField(
                                  heading: AppStrings.passwordheading,
                                  fieldType: TextFieldType.Password,
                                  hinttext: AppStrings.passwordhint),
                              CustomTextField(
                                  heading: AppStrings.emailheading,
                                  fieldType: TextFieldType.Email,
                                  hinttext: AppStrings.emailhint),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.rememberMe,
                                    style: TextStyle(
                                        fontSize: GetScreenSize.getScreenWidth(
                                                context) *
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomButton(
              onTab: () {
                final obj = CommonFunctions();
                obj.checkSignup(context);
              },
              text: AppStrings.signUp,
            ),
          ),
        ),
        if (context.watch<LoginSignupStateProvider>().isSignup)
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
