import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/products_model.dart';
import '../../utils/app_colors.dart';

class OrdersScreen extends StatefulWidget {
  final List<ProductsModel> objects;
  const OrdersScreen({required this.objects, super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    print(AppConstants.getDataList.length);

    print(AppConstants.orderList.length);
    super.initState();
  }

  ProductsModel? findProductById(String itemId) {
    for (ProductsModel product in AppConstants.getDataList) {
      if (product.id == itemId) {
        return product;
      }
    }
    // Return null if no matching product is found
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppWhiteColor,
        title: const Text(
          'Orders',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: AppConstants.orderList.length,
        itemBuilder: (BuildContext context, int index) {
          final userData = AppConstants.orderList[index];
          return Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, top: 10, bottom: 10),
            child: Card(
              elevation: 2,
              color: Colors.grey[200],
              shadowColor: AppColors.appGreyBackground,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 8, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Order Details ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: userData.items.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int itemIndex) {
                        final item = userData.items[itemIndex];
                        //   final count = userData.counts[itemIndex];
                        final product = findProductById(item);

                        if (product != null) {
                          return Column(
                            children: [
                              ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Container(
                                    height: 100,
                                    width: 64.0,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl: product.imageLink[0],
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            baseColor: Colors.grey[
                                                300]!, // Change to your desired base color
                                            highlightColor: Colors.grey[
                                                100]!, // Change to your desired highlight color
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              color: Colors.white,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        )),
                                  ),
                                  title: Text(
                                    '${product.category}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Price:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors
                                                .appGreyText, // Color for "Quantity: "
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\$${product.price}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors
                                                .black, // Color for the count
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          );
                        } else {
                          return Text('This is not your product');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Current Status: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '${userData.status}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Order Time: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '${userData.dateTime}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'SubTotal : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '\$${userData.subTotal}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Total : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '\$${userData.total}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
