import 'package:e_commerence_store_ui/utils/common_functions.dart';
import 'package:e_commerence_store_ui/views/screen_13.dart/textfield.dart';
import 'package:e_commerence_store_ui/views/screen_15.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/media_query.dart';
import '../widgets/back_custom_middle.dart';
import '../widgets/custom_bottom_buttons.dart';

class Screen14 extends StatefulWidget {
  const Screen14({super.key});

  @override
  State<Screen14> createState() => _Screen14State();
}

class _Screen14State extends State<Screen14> {
  bool forIos = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: GetScreenSize.getScreenWidth(context) * 0.17,
              left: GetScreenSize.getScreenWidth(context) * 0.05,
              right: GetScreenSize.getScreenWidth(context) * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const BackCustomMiddle(),
                  const Expanded(child: SizedBox()),
                  Text(
                    AppStrings.payment,
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
              CreditCardWidget(
                width: GetScreenSize.getScreenWidth(context) * 0.9,
                cardNumber:
                    '4242 4242 4242 4242', // Replace with the actual card number
                expiryDate: '12/24', // Replace with the actual expiry date
                cardHolderName:
                    'John Doe', // Replace with the actual cardholder name
                cvvCode: '123', // Replace with the actual CVV
                showBackView: false,
                onCreditCardWidgetChange:
                    (CreditCardBrand) {}, // To show the card's back view
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen15()));
                },
                child: Container(
                    height: 60,
                    width: GetScreenSize.getScreenWidth(context) * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.appPurpleColor),
                      color: AppColors.appGreyBackground,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: AppColors.appPurpleColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          AppStrings.addNewCard,
                          style: TextStyle(
                              fontSize:
                                  GetScreenSize.getScreenWidth(context) * 0.04,
                              color: AppColors.appPurpleColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ))),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Text(
                AppStrings.cardOwner,
                style: TextStyle(
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              TextFieldCustom(
                width: GetScreenSize.getScreenWidth(context) * 0.9,
                hintText: AppStrings.nameHint,
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
                height: GetScreenSize.getScreenWidth(context) * 0.05,
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
                        height: GetScreenSize.getScreenWidth(context) * 0.05,
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
                        height: GetScreenSize.getScreenWidth(context) * 0.05,
                      ),
                      TextFieldCustom(
                        width: GetScreenSize.getScreenWidth(context) * 0.4,
                        hintText: AppStrings.cardCvvHint,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.saveCardInfo,
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
              SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.05,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomButton(
          onTab: () {
            CommonFunctions.cardAdded(context);
          },
          text: AppStrings.saveCard),
    );
  }
}
