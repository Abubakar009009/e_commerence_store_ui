import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/views/screen_13.dart/screen_13.dart';
import 'package:e_commerence_store_ui/widgets/cart_product.dart';
import 'package:e_commerence_store_ui/widgets/custom_bottom_buttons.dart';
import 'package:flutter/material.dart';

import '../models/products_model.dart';
import '../utils/media_query.dart';
import '../widgets/back_custom_middle.dart';

class Screen12 extends StatefulWidget {
  final List<ProductsModel> listofproducts;
  const Screen12({required this.listofproducts, super.key});

  @override
  State<Screen12> createState() => _Screen12State();
}

class _Screen12State extends State<Screen12> {
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
                    'Cart',
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
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CartProduct(object: widget.listofproducts[index]),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Address',
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.060,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: GetScreenSize.getScreenWidth(context) * 0.06,
                  )
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset('assets/images/Rectangle 584.jpg'),
                title: Text(
                  'Chhatak, Sunamgonj 12/8AB',
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
                  'Sylhet',
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
                    'Payment Method',
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.060,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: GetScreenSize.getScreenWidth(context) * 0.06,
                  )
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset('assets/images/visa.png'),
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
                'Order Info',
                style: TextStyle(
                    color: AppColors.appBlackText,
                    fontSize: GetScreenSize.getScreenWidth(context) * 0.060,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub Total',
                    style: TextStyle(
                        color: AppColors.appGreyText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.040,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\$110',
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
                    'Shipping Cost',
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
                    'Total',
                    style: TextStyle(
                        color: AppColors.appGreyText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.040,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\$120',
                    style: TextStyle(
                        color: AppColors.appBlackText,
                        fontSize: GetScreenSize.getScreenWidth(context) * 0.050,
                        fontWeight: FontWeight.w500),
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
                context, MaterialPageRoute(builder: (context) => Screen13()));
          },
          text: 'Checkout'),
    );
  }
}
