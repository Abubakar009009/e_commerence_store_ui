import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_constants_admin.dart';

class ShowAllProductsAdmin extends StatelessWidget {
  const ShowAllProductsAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Products',
          style: TextStyle(color: AppColors.appBlackText),
        ),
        backgroundColor: AppColors.AppWhiteColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back, // You can change this to the back icon you want
            color: AppColors.appBlackText, // Set the color here
          ),
          onPressed: () {
            Navigator.pop(context);
            // Handle the back button press here
          },
        ),
      ),
      body: ListView.builder(
        itemCount: AppConstantsAdmin.productsList.length,
        itemBuilder: (BuildContext context, int index) {
          final product = AppConstantsAdmin.productsList[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductsModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.appGreyBackground, width: 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 0, top: 10),
              child: SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Image.network(
                      product.imageLink[0],
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.category,
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.appBlackText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Price: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.appGreyText,
                                  ),
                                ),
                                TextSpan(
                                  text: '\$${product.price}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.appBlackText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Category: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.appGreyText,
                                  ),
                                ),
                                TextSpan(
                                  text: product.name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.appBlackText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (BuildContext context) {
                          return [
                            const PopupMenuItem<String>(
                              value: 'edit',
                              child: ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: 'delete',
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                              ),
                            ),
                          ];
                        },
                        onSelected: (String choice) {
                          if (choice == 'edit') {
                            // Handle the "Edit" option here
                            // You can navigate to an edit screen
                          } else if (choice == 'delete') {
                            // Handle the "Delete" option here
                            // You can show a confirmation dialog or perform the deletion directly
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
