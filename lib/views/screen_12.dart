import 'package:e_commerence_store_ui/utils/app_assets.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/views/screen_13.dart/screen_13.dart';
import 'package:e_commerence_store_ui/views/screen_14.dart';
import 'package:e_commerence_store_ui/views/screen_16.dart';
import 'package:e_commerence_store_ui/widgets/cart_product.dart';
import 'package:e_commerence_store_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/add_to_cart_provider.dart';
import '../utils/app_strings.dart';
import '../utils/media_query.dart';

class Screen12 extends StatefulWidget {
  const Screen12({super.key});

  @override
  State<Screen12> createState() => _Screen12State();
}

class _Screen12State extends State<Screen12> {
  @override
  void initState() {
    // TODO: implement initState
    //context.read<AddtocartProvider>().calculateTotalCost();
    super.initState();

    context.read<AddtocartProvider>().calculateTotalCost();
  }

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
                  const Expanded(child: SizedBox()),
                  Text(
                    AppStrings.cartText,
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.060,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: context
                        .watch<AddtocartProvider>()
                        .cartProducts
                        .isEmpty
                    ? 0
                    : context.watch<AddtocartProvider>().cartProducts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CartProduct(
                          object: context
                              .watch<AddtocartProvider>()
                              .cartProducts[index]),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.deliveryText,
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.060,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screen13()));
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: GetScreenSize.getScreenWidth(context) * 0.06,
                    ),
                  )
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(AppAssets.locationImage),
                title: Text(
                  AppStrings.addressText,
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                      color: AppColors.appBlackText,
                      fontWeight: FontWeight.w400),
                ),
                trailing: Icon(
                  Icons.check_circle,
                  color: AppColors.greenTick,
                  size: GetScreenSize.getScreenWidth(context) * 0.09,
                ),
                subtitle: Text(
                  AppStrings.addressCity,
                  style: TextStyle(
                      color: AppColors.appGreyText,
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.04),
                ),
                selected: true,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.paymentMethod,
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.060,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screen14()));
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: GetScreenSize.getScreenWidth(context) * 0.06,
                    ),
                  )
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(AppAssets.visaImage),
                title: Text(
                  'Visa Classic',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.04,
                      color: AppColors.appBlackText,
                      fontWeight: FontWeight.w400),
                ),
                trailing: Icon(
                  Icons.check_circle,
                  color: AppColors.greenTick,
                  size: GetScreenSize.getScreenWidth(context) * 0.09,
                ),
                subtitle: Text(
                  '**** 7690',
                  style: TextStyle(
                      color: AppColors.appGreyText,
                      fontSize: GetScreenSize.getScreenWidth(context) * 0.04),
                ),
                selected: true,
              ),
              Text(
                AppStrings.orderInfoTitle,
                style: TextStyle(
                    color: AppColors.appBlackText,
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.060,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.subTotal,
                    style: TextStyle(
                        color: AppColors.appGreyText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.040,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\$ ${context.watch<AddtocartProvider>().subTotalCost}',
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.050,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.shippingCost,
                    style: TextStyle(
                        color: AppColors.appGreyText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.040,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\$10',
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.050,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.total,
                    style: TextStyle(
                        color: AppColors.appGreyText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.040,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\$ ${context.watch<AddtocartProvider>().totalCost}',
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.050,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextButton(
                onTab: () {
                  context.read<AddtocartProvider>().placeOrder(context);
                },
                buttonText: 'Check Out',
                buttonColor: AppColors.appPurpleColor,
                radius: 15,
                fontSize: 17,
                fontColor: AppColors.AppWhiteColor,
                // addIcon: true,
                //icon: const FaIcon(FontAwesomeIcons.facebook),
                height: MediaQuery.of(context).size.height * 0.070,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
