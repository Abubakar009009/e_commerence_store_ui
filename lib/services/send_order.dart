import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firebase_admin/model/order_model.dart';
import '../models/orders_model.dart';
import '../views/screen_16.dart';

class SendOrder {
  static Future<void> placeOrder(
    BuildContext context,
    List<String> items,
    List<String> vendorIds,
    List<int> counts,
    int total,
    int subTotal,
  ) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final CollectionReference ordersCollection =
            firestore.collection('orders');

        // Create a new document with a random ID and store order data in it
        final DocumentReference newOrderDocRef = ordersCollection.doc();

        // Convert the list of integers to a list of strings
        final List<String> countStrings =
            counts.map((count) => count.toString()).toList();

        // Add the order data to the document
        await newOrderDocRef.set({
          'items': items,
          'count': countStrings, // Store counts as strings
          'total': total,
          'subtotal': subTotal,
          'timestamp': FieldValue.serverTimestamp(),
          'status': 'Pending',
          'user_id': user.uid,
          'vendor_id': vendorIds,
        });

        await getOrders();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Screen16()),
        );
      } else {
        // Handle the case where the user is not logged in.
      }
    } catch (e) {
      // Handle errors here
      throw e;
    }
  }

  static Future<void> getOrders() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final CollectionReference ordersCollection =
            firestore.collection('orders');

        final QuerySnapshot orderSnapshot = await ordersCollection
            .where('user_id', isEqualTo: user.uid) // Filter by user_id
            .get();

        AppConstants.orderList = [];

        final List<OrderModel> ordersList = orderSnapshot.docs.map((doc) {
          final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          final List<String> items = List<String>.from(data['items'] ?? []);
          final List<int> counts = List<int>.from(data['counts'] ?? []);
          final int total = data['total'] ?? 0;
          final int subTotal = data['subtotal'] ?? 0;
          final Timestamp timestamp = data['timestamp'] as Timestamp;
          final DateTime dateTime = timestamp.toDate();
          final String status = data['status'] ?? 'Pending';
          final String idCustomer =
              user.uid; // Assuming you want to use the user's UID as idCustomer

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

        AppConstants.orderList = ordersList;
        print(AppConstants.orderList.length);
      } else {
        print('User not logged in.');
      }
    } catch (e) {
      // Handle errors here
      print('Error getting orders: $e');
      throw e;
    }
  }
}
