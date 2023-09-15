import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/app_constants_admin.dart';
import 'model/order_model.dart';

class GetDataAdmin {
  static Future<List<ProductsModel>> getDataFromFirebase() async {
    try {
      final CollectionReference productsCollection =
          FirebaseFirestore.instance.collection('products');

      final User? user = FirebaseAuth.instance.currentUser;

      final QuerySnapshot productSnapshot = await productsCollection
          .where('vendor_id', isEqualTo: user!.uid) // Filter by user_id
          .get();

      //  final QuerySnapshot productSnapshot = await productsCollection.get();
      AppConstantsAdmin.productsList = [];
      for (QueryDocumentSnapshot productDocument in productSnapshot.docs) {
        final Map<String, dynamic> productData = productDocument.data()
            as Map<String, dynamic>; // Convert data to a Map

        final ProductsModel product = ProductsModel(
          name: productData['name'] ?? '',
          description: productData['description'] ?? '',
          totalPrice: productData['totalPrice'] ?? '',
          reviews: AppConstants.reviewsList, // Assign your reviews list here
          imageLink: List<String>.from(productData['images'] ?? []),
          category: productData['category'] ?? '',
          price: productData['price'] ?? '',
          approval: productData['approval'] ?? '',
          id: productData['id of product'] ?? '',
        );

        // Add the product to the list
        AppConstantsAdmin.productsList.add(product);
      }

      return AppConstantsAdmin.productsList;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  static Future<List<OrderModel>> getAllOrders() async {
    // try {
    //   final FirebaseFirestore firestore = FirebaseFirestore.instance;

    //   // Reference to the "orders" collection
    //   final CollectionReference ordersCollection =
    //       firestore.collection('orders');

    //   // Get all documents in the "orders" collection
    //   final QuerySnapshot ordersSnapshot = await ordersCollection.get();

    //   // Extract order data from the documents
    //   final List<OrderModel> ordersList = ordersSnapshot.docs.map((doc) {
    //     final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    //     final List<String> items = List<String>.from(data['items'] ?? []);
    //     final List<int> counts = data['count']
    //         .map<int>((count) => int.parse(count as String))
    //         .toList();
    //     final int total = data['total'] ?? 0;
    //     final int subTotal = data['subtotal'] ?? 0;
    //     final Timestamp timestamp = data['timestamp'] as Timestamp;
    //     final DateTime dateTime = timestamp.toDate();
    //     final String status = data['status'] ?? 'Pending';
    //     final String idCustomer = data['user_id'] ?? '';

    //     return OrderModel(
    //       items: items,
    //       counts: counts,
    //       total: total,
    //       subTotal: subTotal,
    //       dateTime: dateTime,
    //       status: status,
    //       idCustomer: idCustomer,
    //     );
    //   }).toList();

    //   return ordersList;
    // } catch (e) {
    //   print('Error fetching orders: $e');
    //   throw e;
    // }
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final FirebaseAuth auth = FirebaseAuth.instance;

      // Get the current user's UID
      final String currentUserUid = auth.currentUser!.uid;

      // Reference to the "orders" collection
      final CollectionReference ordersCollection =
          firestore.collection('orders');
      print(currentUserUid);

      // Query for orders where the "vendor_ids" list contains the current user's UID
      final QuerySnapshot ordersSnapshot = await ordersCollection
          .where('vendor_id', arrayContains: currentUserUid)
          .get();

      // Extract order data from the documents
      final List<OrderModel> ordersList = ordersSnapshot.docs.map((doc) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        final List<String> items = List<String>.from(data['items'] ?? []);
        final List<int> counts = data['count']
            .map<int>((count) => int.parse(count as String))
            .toList();
        final int total = data['total'] ?? 0;
        final int subTotal = data['subtotal'] ?? 0;
        final Timestamp timestamp = data['timestamp'] as Timestamp;
        final DateTime dateTime = timestamp.toDate();
        final String status = data['status'] ?? 'Pending';
        final String idCustomer = data['user_id'] ?? '';

        return OrderModel(
          items: items,
          counts: counts,
          total: total,
          subTotal: subTotal,
          dateTime: dateTime,
          status: status,
          idCustomer: idCustomer,
        );
      }).toList();

      return ordersList;
    } catch (e) {
      // Handle exceptions here
      print('Error: $e');
      return []; // Return an empty list or handle the error as needed
    }
  }

  static Future<void> updateStatus(
      BuildContext context, String customerId) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference to the "orders" collection
      final CollectionReference ordersCollection =
          firestore.collection('orders');

      // Find the specific order document using the customer ID
      QuerySnapshot orderSnapshot = await ordersCollection
          .where('user_id', isEqualTo: customerId)
          .limit(1)
          .get();

      // Check if a matching order was found
      if (orderSnapshot.docs.isNotEmpty) {
        // Get the reference to the order document
        DocumentReference orderDocumentRef = orderSnapshot.docs.first.reference;

        // Update the status field to 'approved'
        await orderDocumentRef.update({'status': 'approved'});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data Updated Successfully Refresh to get Changes'),
            duration: Duration(seconds: 3), // Adjust the duration as needed
          ),
        );

        // Optionally, you can re-fetch the updated data or update the UI as needed.
      } else {
        print('Order not found for customer ID: $customerId');
      }
    } catch (e) {
      print('Error updating status: $e');
      // Handle the error as needed.
    }
  }
}
