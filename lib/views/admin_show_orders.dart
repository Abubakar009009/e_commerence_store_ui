// ignore_for_file: unnecessary_string_interpolations

import 'package:e_commerence_store_ui/firebase_admin/get_all_admin_data.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/views/add_data_screen.dart';
import 'package:e_commerence_store_ui/views/splash_screen.dart';
import 'package:e_commerence_store_ui/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/products_model.dart';
import '../utils/app_constants_admin.dart';

class AdminShowOrder extends StatefulWidget {
  const AdminShowOrder({Key? key}) : super(key: key);

  @override
  State<AdminShowOrder> createState() => _AdminShowOrderState();
}

class _AdminShowOrderState extends State<AdminShowOrder> {
  ProductsModel? findProductById(String itemId) {
    for (ProductsModel product in AppConstantsAdmin.productsList) {
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
        title: const Text(
          'Orders',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // Remove the back button
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Log out the current user
              await FirebaseAuth.instance.signOut();

              // Navigate to CheckUserType
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SplashScreen()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          // Image.asset(
          //   'assets/images/splash.png', // Replace with your image asset
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.appGreyBackground,
          ),

          // Content
          ListView.builder(
            itemCount: AppConstantsAdmin.orders.length,
            itemBuilder: (BuildContext context, int index) {
              final userData = AppConstantsAdmin.orders[index];
              return Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 10, bottom: 10),
                child: Card(
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
                          height: 15,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Customer ID : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '${userData.idCustomer}',
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
                        //  Text(' ${userData.idCustomer}'),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: userData.items.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int itemIndex) {
                            final item = userData.items[itemIndex];
                            final count = userData.counts[itemIndex];

                            // Find the product with a matching ID
                            final product = findProductById(item);

                            // Check if a matching product was found
                            if (product != null) {
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  height: 100,
                                  width: 64.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      product.imageLink[0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  ' ${product.name}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  'Quantity: $count',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            } else {
                              return Text('Product with ID $item not found');
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
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomTextButton(
                            onTab: () => GetDataAdmin.updateStatus(
                              context,
                              userData.idCustomer,
                            ),
                            buttonText: 'Approve',
                            buttonColor: Colors.black.withOpacity(0.7),
                            radius: 20,
                            fontColor: AppColors.AppWhiteColor,
                            width: 100,
                            height: 40,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddDataScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
