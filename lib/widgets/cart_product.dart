import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/media_query.dart';

class CartProduct extends StatefulWidget {
  final ProductsModel object;
  const CartProduct({required this.object, super.key});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int itemCount = 1;

  void incrementCount() {
    setState(() {
      itemCount++;
    });
  }

  void decrementCount() {
    if (itemCount > 1) {
      setState(() {
        itemCount--;
      });
    }
  }

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
                child: Image.asset(
                  widget.object.imageLink[0],
                ),
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
                      'Men\'s Tie-Dye T sdf  sss-ShirtNike Sportswear',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize:
                              GetScreenSize.getScreenWidth(context) * 0.04,
                          color: AppColors.appBlackText,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('\$45 (-\$4.00 Tax)'),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                decrementCount();
                              },
                              icon: Icon(Icons.remove_circle),
                            ),
                            Text(
                              '$itemCount',
                              style: TextStyle(
                                fontSize:
                                    GetScreenSize.getScreenWidth(context) *
                                        0.04,
                                color: AppColors.appBlackText,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                incrementCount();
                              },
                              icon: Icon(Icons.add_circle_outlined),
                            ),
                          ],
                        ),
                        Icon(Icons.delete_outline_rounded)
                      ],
                    ),
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
