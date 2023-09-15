import 'package:flutter/material.dart';

import '../../firebase_admin/model/order_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/media_query.dart';

class OrdersWidget extends StatefulWidget {
  final OrderModel object;
  const OrdersWidget({required this.object, super.key});

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appGreyBackground,
          borderRadius: BorderRadius.circular(20)),
      height: GetScreenSize.getScreenWidth(context) * 0.40,
      width: GetScreenSize.getScreenWidth(context) * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: GetScreenSize.getScreenWidth(context) * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/Group 2.png'),
              ),
            ),
            Container(
              width: GetScreenSize.getScreenWidth(context) * 0.53,
              height: MediaQuery.of(context).size.height,
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sub Total \$${widget.object.subTotal}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.04,
                          color: AppColors.appBlackText,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Total Cost \$${widget.object.total}',
                      style: TextStyle(
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.04,
                          color: AppColors.appBlackText,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Total items in order ${widget.object.items.length}',
                      style: TextStyle(
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.04,
                          color: AppColors.appBlackText,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${widget.object.status} ',
                              style: TextStyle(
                                  fontSize:
                                      GetScreenSize.getScreenWidth(context) *
                                          0.045,
                                  color: AppColors.appBlackText,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
