import 'package:e_commerence_store_ui/views/screen_13.dart/textfield.dart';
import 'package:e_commerence_store_ui/views/screen_16.dart';
import 'package:e_commerence_store_ui/widgets/custom_bottom_buttons.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/media_query.dart';
import '../widgets/back_custom_middle.dart';

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
                    'Add New Card',
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
                            ? Colors.orange
                                .withOpacity(0.3) // Yellow border if selected
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
                          'assets/icons/image_9-removebg-preview.png',
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
                            ? Colors.orange
                                .withOpacity(0.3) // Yellow border if selected
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
                          'assets/icons/image_10-removebg-preview.png',
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
                            ? Colors.orange
                                .withOpacity(0.3) // Yellow border if selected
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
                          'assets/icons/bank-building.png',
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
                'Card Owner',
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.03,
              ),
              TextFieldCustom(
                width: GetScreenSize.getScreenWidth(context) * 0.9,
                hintText: 'Mrh Raju',
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Text(
                'Card Number',
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.03,
              ),
              TextFieldCustom(
                width: GetScreenSize.getScreenWidth(context) * 0.9,
                hintText: '5254 7634 8734 7690',
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
                        'EXP',
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
                        hintText: '24/24',
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CVV',
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
                        hintText: '7763',
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButtomButton(
          onTab: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen16()));
          },
          text: 'Add Card'),
    );
  }
}
