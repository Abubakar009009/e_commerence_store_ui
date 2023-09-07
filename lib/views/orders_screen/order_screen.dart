import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:e_commerence_store_ui/views/orders_screen/orders_widget.dart';
import 'package:flutter/material.dart';

import '../../models/products_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/media_query.dart';
import '../../widgets/back_custom_middle.dart';
import '../../widgets/cart_product.dart';

class OrdersScreen extends StatefulWidget {
  final List<ProductsModel> objects;
  const OrdersScreen({required this.objects, super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const BackCustomMiddle(),
                  const Expanded(child: SizedBox()),
                  Text(
                    'Orders Details',
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
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: AppConstants.orderList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      OrdersWidget(object: AppConstants.orderList[index]),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
