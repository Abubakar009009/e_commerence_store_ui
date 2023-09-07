import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';

class WishlistData {
  static Future<void> addToWishlist(String item) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final CollectionReference wishlistCollection =
            firestore.collection('wishlist');

        final CollectionReference userWishlistCollection =
            wishlistCollection.doc(user.uid).collection('user_wishlist');

        await userWishlistCollection.add({
          'item': item,
        });
        initializeWishlist();

        // print('Item added to wishlist for user ${user.uid}: $item');
      } else {
        // print('User not logged in.');
      }
    } catch (e) {
      print('Error adding item to wishlist: $e');
      throw e;
    }
  }

  static Future<void> initializeWishlist() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final CollectionReference wishlistCollection =
            firestore.collection('wishlist');

        final CollectionReference userWishlistCollection =
            wishlistCollection.doc(user.uid).collection('user_wishlist');

        final QuerySnapshot wishlistSnapshot =
            await userWishlistCollection.get();
        AppConstants.wishlistProducts = [];
        final List<String> productIds =
            AppConstants.getDataList.map((product) => product.id).toList();

        wishlistSnapshot.docs.forEach((document) {
          final String item = document.get('item');
          if (productIds.contains(item)) {
            final ProductsModel product = AppConstants.getDataList
                .firstWhere((product) => product.id == item);
            AppConstants.wishlistProducts.add(product);
          }
        });

        //  print('Wishlist initialized for user ${user.uid}');
      } else {
        //  print('User not logged in.');
      }
    } catch (e) {
      print('Error initializing wishlist: $e');
      throw e;
    }
  }
}
