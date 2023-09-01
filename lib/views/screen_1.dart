import 'package:e_commerence_store_ui/utils/app_assets.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/app_strings.dart';
import 'package:e_commerence_store_ui/views/screen_2.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          AppAssets.screen1image,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 40,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: AppColors.AppWhiteColor,
              borderRadius: BorderRadius.circular(
                  20.0), // Adjust the radius value as needed
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.lookgood,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appBlackText,
                    ),
                  ),
                  Text(
                    AppStrings.mainText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appGreyText,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    //  color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextButton(
                          buttonColor: AppColors.appGreyBackground,
                          buttonText: AppStrings.men,
                          fontSize: 18,
                          onTab: () {},
                          radius: 10,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 3,
                          fontColor: AppColors.appGreyText,
                        ),
                        CustomTextButton(
                          buttonColor: AppColors.appPurpleColor,
                          buttonText: AppStrings.women,
                          fontSize: 18,
                          onTab: () {},
                          radius: 10,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 3,
                          fontColor: AppColors.AppWhiteColor,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Screen2()));
                    },
                    child: Text(
                      AppStrings.skip,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.appGreyText,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
