import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerence_store_ui/utils/common_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/cart_product_model.dart';

class AddToCart {
  static Future<void> addToCart(String item, BuildContext context) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final CollectionReference cartCollection =
            firestore.collection('addtocart');

        final CollectionReference userCartCollection =
            cartCollection.doc(user.uid).collection('items');

        // Add the item with the document reference ID
        final DocumentReference itemDocRef = await userCartCollection.add({
          'item': item,
          'itemid':
              '', // Initialize with an empty ID (it will be replaced with the auto-generated ID)
        });

        // Update the 'itemid' field with the document reference ID
        await itemDocRef.update({'itemid': itemDocRef.id});
        await CommonFunctions.getCartProducts(context);
      } else {
        print('User not logged in.');
      }
    } catch (e) {
      print('Error adding to cart: $e');
      throw e;
    }
  }

  static Future<List<CartProduct>> getAllItems() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final CollectionReference cartCollection =
            firestore.collection('addtocart');

        final CollectionReference userCartCollection =
            cartCollection.doc(user.uid).collection('items');

        final QuerySnapshot itemsSnapshot = await userCartCollection.get();

        final List<CartProduct> items = itemsSnapshot.docs.map((doc) {
          return CartProduct(
            itemid: doc.get('itemid') ?? '',
            productid: doc.get('item') ?? '',
          );
        }).toList();

        return items;
      } else {
        print('User not logged in.');
        return [];
      }
    } catch (e) {
      print('Error fetching cart items: $e');
      throw e;
    }
  }

  static Future<void> deleteItem(String itemId) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final CollectionReference cartCollection =
            firestore.collection('addtocart');

        final CollectionReference userCartCollection =
            cartCollection.doc(user.uid).collection('items');

        // Delete the item with the specified itemId
        await userCartCollection.doc(itemId).delete();
      } else {
        print('User not logged in.');
      }
    } catch (e) {
      print('Error deleting item: $e');
      throw e;
    }
  }
}
