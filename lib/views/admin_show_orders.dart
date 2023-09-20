// ignore_for_file: unnecessary_string_interpolations

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerence_store_ui/firebase_admin/get_all_admin_data.dart';
import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/views/admin_drawer.dart';
import 'package:e_commerence_store_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../models/products_model.dart';
import '../utils/app_constants_admin.dart';
import 'add_data_screen.dart';

class AdminShowOrder extends StatefulWidget {
  const AdminShowOrder({Key? key}) : super(key: key);

  @override
  State<AdminShowOrder> createState() => _AdminShowOrderState();
}

class _AdminShowOrderState extends State<AdminShowOrder> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.AppWhiteColor,
        title: const Text(
          'Orders',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Open the drawer
          },
        ),
      ),
      drawer: AdminDrawer(),
      body: ListView.builder(
        itemCount: AppConstantsAdmin.orders.length,
        itemBuilder: (BuildContext context, int index) {
          final userData = AppConstantsAdmin.orders[index];
          // return Padding(
          //   padding:
          //       const EdgeInsets.only(left: 8.0, right: 8, top: 10, bottom: 10),
          //   child: Card(
          //     elevation: 3,
          //     color: AppColors.AppWhiteColor,
          //     shadowColor: AppColors.appGreyBackground,
          //     child: Padding(
          //       padding: const EdgeInsets.only(
          //           left: 20.0, right: 8, top: 10, bottom: 10),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const SizedBox(
          //             height: 15,
          //           ),
          //           const Text(
          //             'Order Details ',
          //             style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           const SizedBox(
          //             height: 15,
          //           ),
          //           RichText(
          //             text: const TextSpan(
          //               children: [
          //                 TextSpan(
          //                   text: 'Products : ',
          //                   style: TextStyle(
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.bold,
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           //  Text(' ${userData.idCustomer}'),
          //           ListView.builder(
          //             shrinkWrap: true,
          //             itemCount: userData.items.length,
          //             physics: const NeverScrollableScrollPhysics(),
          //             itemBuilder: (BuildContext context, int itemIndex) {
          //               final item = userData.items[itemIndex];
          //               final count = userData.counts[itemIndex];

          //               // Find the product with a matching ID
          //               final product = findProductById(item);

          //               // Check if a matching product was found
          //               if (product != null) {
          //                 return ListTile(
          //                     contentPadding: EdgeInsets.zero,
          //                     leading: Container(
          //                       height: 100,
          //                       width: 64.0,
          //                       child: ClipRRect(
          //                         borderRadius: BorderRadius.circular(8.0),
          //                         child: Image.network(
          //                           product.imageLink[0],
          //                           fit: BoxFit.cover,
          //                         ),
          //                       ),
          //                     ),
          //                     title: Text(
          //                       ' ${product.category}',
          //                       style: const TextStyle(
          //                         fontWeight: FontWeight.w600,
          //                       ),
          //                     ),
          //                     subtitle: RichText(
          //                       text: TextSpan(
          //                         children: [
          //                           TextSpan(
          //                             text: 'Quantity: ',
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.w600,
          //                               color: AppColors.appGreyText,
          //                             ),
          //                           ),
          //                           TextSpan(
          //                             text: '$count',
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.w600,
          //                               color: AppColors.appGreyText,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ));
          //               } else {
          //                 return Container();
          //               }
          //             },
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           RichText(
          //             text: TextSpan(
          //               children: [
          //                 const TextSpan(
          //                   text: 'Current Status: ',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //                 TextSpan(
          //                   text: '${userData.status}',
          //                   style: const TextStyle(
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           RichText(
          //             text: TextSpan(
          //               children: [
          //                 const TextSpan(
          //                   text: 'Order Time: ',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //                 TextSpan(
          //                   text: '${userData.dateTime}',
          //                   style: const TextStyle(
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           RichText(
          //             text: TextSpan(
          //               children: [
          //                 const TextSpan(
          //                   text: 'SubTotal : ',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //                 TextSpan(
          //                   text: '\$${userData.subTotal}',
          //                   style: const TextStyle(
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           RichText(
          //             text: TextSpan(
          //               children: [
          //                 const TextSpan(
          //                   text: 'Total : ',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //                 TextSpan(
          //                   text: '\$${userData.total}',
          //                   style: const TextStyle(
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           Align(
          //             alignment: Alignment.bottomCenter,
          //             child: CustomTextButton(
          //                 onTab: () => GetDataAdmin.updateStatus(
          //                       context,
          //                       userData.idCustomer,
          //                     ),
          //                 padding: const EdgeInsets.all(8),
          //                 width: 150,
          //                 buttonText: 'Accept Order',
          //                 // height: 50,
          //                 buttonColor: AppColors.appPurpleColor,
          //                 radius: 10,
          //                 fontSize: 17),
          //             // child: CustomTextButton(
          //             //   onTab: () => GetDataAdmin.updateStatus(
          //             //     context,
          //             //     userData.idCustomer,
          //             //   ),
          //             //   buttonText: 'Accept',
          //             //   buttonColor: Colors.black.withOpacity(0.7),
          //             //   radius: 20,
          //             //   fontColor: AppColors.AppWhiteColor,
          //             //   width: 100,
          //             //   height: 40,
          //             //   fontSize: 15,
          //             // ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // );
          return Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 0.1, color: AppColors.appGreyText),
              ),
              //  elevation: 2,
              //color: Colors.grey[200],
              // shadowColor: AppColors.appGreyBackground,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 8, top: 0, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Order Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            children: [
                              // const TextSpan(
                              //   text: 'Total : ',
                              //   style: TextStyle(
                              //     font
                              //     fontWeight: FontWeight.bold,
                              //     color: Colors.black,
                              //   ),
                              // ),
                              TextSpan(
                                text: '\$${userData.total}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: userData.items.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int itemIndex) {
                        final item = userData.items[itemIndex];
                        final count = userData.counts[itemIndex];
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
                                              const Icon(Icons.error),
                                        )),
                                  ),
                                  title: Text(
                                    product.category,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Quantity: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors
                                                .appGreyText, // Color for "Quantity: "
                                          ),
                                        ),
                                        TextSpan(
                                          text: '$count',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors
                                                .black, // Color for the count
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              //  Divider()
                            ],
                          );
                        } else {
                          return Container();
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
                            text: userData.status,
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
                      height: 20,
                    ),
                    Center(
                      child: CustomTextButton(
                          onTab: () => GetDataAdmin.updateStatus(
                                context,
                                userData.idCustomer,
                              ),
                          padding: const EdgeInsets.all(8),
                          width: 150,
                          buttonText: 'Accept Order',
                          // height: 50,
                          buttonColor: AppColors.appPurpleColor,
                          radius: 10,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddDataScreen()),
          );
        },
        backgroundColor: Colors.black.withOpacity(0.7),
        child: Icon(
          Icons.add,
          color: AppColors.AppWhiteColor,
        ),
      ),
    );
  }
}
