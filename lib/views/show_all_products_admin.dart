import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:flutter/material.dart';

import '../utils/app_constants_admin.dart';

class ShowAllProductsAdmin extends StatelessWidget {
  const ShowAllProductsAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                product.imageLink[0], // Assuming the first image link
              ),
            ),
          ),
        ),
        title: Text(
          product.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price: \$${product.price}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Category: ${product.category}',
              style: TextStyle(fontSize: 16),
            ),
            // Add other details here
          ],
        ),
        // trailing: ElevatedButton(
        //   onPressed: () {
        //     // Implement your action when the button is pressed
        //   },
        //   child: Text('Delete Product'),
        // ),
      ),
    );
  }
}
