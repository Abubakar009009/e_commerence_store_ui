import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';

class GetData {
  Future<List<ProductsModel>> getDataFromFirebase() async {
    final List<ProductsModel> productsList = [];

    try {
      final CollectionReference productsCollection =
          FirebaseFirestore.instance.collection('products');

      final QuerySnapshot productSnapshot = await productsCollection.get();

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
          vendorId: productData['vendor_id'] ?? '',
        );

        // Add the product to the list
        productsList.add(product);
        //AppConstants.adidasList = [];
        AppConstants.nikeList = [];
        AppConstants.filaList = [];

        if (product.category == 'adidas') {
          AppConstants.adidasList.add(product);
        } else if (product.category == 'Puma') {
          AppConstants.nikeList.add(product);
        } else if (product.category == 'Fila') {
          AppConstants.filaList.add(product);
        }
        if (AppConstants.wishlist.contains(product.id)) {
          AppConstants.wishlistProducts.add(product);
        }
      }

      return productsList;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }
}
