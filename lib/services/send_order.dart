import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/orders_model.dart';
import '../views/screen_16.dart';

class SendOrder {
  static Future<void> placeOrder(
    BuildContext context,
    List<String> items,
    int total,
    int subTotal,
  ) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final CollectionReference ordersCollection =
            firestore.collection('orders');

        final CollectionReference userOrdersCollection =
            ordersCollection.doc(user.uid).collection('user_orders');

        // Add the order data to the user's orders subcollection
        await userOrdersCollection.add({
          'items': items,
          'total': total,
          'subtotal': subTotal,
          'timestamp': FieldValue.serverTimestamp(),
          'status': 'Pending',
        });
        await getOrders();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Screen16()));
      } else {
        //  print('User not logged in.');
      }
    } catch (e) {
      // Handle errors here
      //  print('Error placing order: $e');
      throw e;
    }
  }

  static Future<void> getOrders() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final CollectionReference ordersCollection = firestore
            .collection('orders')
            .doc(user.uid)
            .collection('user_orders');

        final QuerySnapshot orderSnapshot = await ordersCollection.get();
        AppConstants.orderList = [];

        final List<OrdersModel> ordersList = orderSnapshot.docs.map((doc) {
          final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          final List<String> items = List<String>.from(data['items'] ?? []);
          final int total = data['total'] ?? '';
          final int subTotal = data['subtotal'] ?? '';
          final Timestamp timestamp = data['timestamp'] as Timestamp;
          final DateTime dateTime =
              timestamp.toDate(); // Convert Timestamp to DateTime
          final String status = data['status'] ?? 'Pending';

          return OrdersModel(
            total: total,
            subTotal: subTotal,
            items: items,
            dateTime: dateTime,
            orderStatus: status,
          );
        }).toList();

        AppConstants.orderList = ordersList;
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
