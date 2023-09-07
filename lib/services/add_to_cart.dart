import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerence_store_ui/models/products_model.dart';

class AddToCart {
  static Future<void> addToCart(ProductsModel product, String userId) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Create a reference to the Firestore collection
      final CollectionReference cartCollection =
          firestore.collection('addtocart');

      // Upload images to Firebase Storage and get download URLs
      final List<String> imageUrls = product.imageLink;

      // Save product data to Firestore under the user's ID
      await cartCollection.doc(userId).collection('items').add({
        'name': product.name,
        'category': product.category,
        'price': product.price,
        'description': product.description,
        'totalPrice': product.totalPrice,
        'images': imageUrls,
        'id of product': product.id,
        'approval': 'No',
      });

      // You can add any other logic you need here.
    } catch (e) {
      print('Error adding to cart: $e');
      throw e;
    }
  }
}

// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../models/products_model.dart';

// class AddToCart {
//   static Future<void> addToCart(ProductsModel product) async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();

//       // Get the existing cart data from shared preferences, if any
//       final List<String>? existingCartData = prefs.getStringList('addtocart');

//       // Create a new cart list or use the existing one
//       final List<String> cartData = existingCartData ?? [];

//       // Serialize the product to a JSON string and add it to the cart list
//       final String productJson = productToJson(product);
//       cartData.add(productJson);

//       // Store the updated cart data back in shared preferences
//       prefs.setStringList('addtocart', cartData);

//       // You can add any other logic you need here.
//     } catch (e) {
//       print('Error adding to cart: $e');
//       throw e;
//     }
//   }

//   // Helper function to serialize a ProductModel to JSON
//   static String productToJson(ProductsModel product) {
//     // You can use a JSON serialization library like 'dart:convert'
//     // to convert your object to a JSON string. For simplicity, I'll use a basic approach.
//     final Map<String, dynamic> json = {
//       'name': product.name,
//       'category': product.category,
//       'price': product.price,
//       'description': product.description,
//       'totalPrice': product.totalPrice,
//       'images': product.imageLink,
//       'id of product': product.id,
//       'approval': 'No',
//     };

//     return jsonEncode(json);
//   }
// }
