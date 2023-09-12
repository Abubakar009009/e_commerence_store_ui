import 'package:e_commerence_store_ui/models/cart_product_model.dart';
import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:e_commerence_store_ui/services/add_to_cart.dart';
import 'package:e_commerence_store_ui/services/send_order.dart';
import 'package:e_commerence_store_ui/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';

class AddtocartProvider extends ChangeNotifier {
  List<ProductsModel> list = [];
  List<ProductsModel> get cartProducts => list;
  int subTotal = 0;
  int total = 0;
  int get totalCost => total;
  int get subTotalCost => subTotal;

  void initializeList() {
    list = AppConstants.cartData;
    notifyListeners();
  }

  void deleteProduct(ProductsModel product) async {
    await AddToCart.deleteItem(product.cartid);
    list.remove(product);
    calculateTotalCost();
    notifyListeners();
  }

  void calculateTotalCost() {
    if (list.isNotEmpty) {
      subTotal = list
          .map((product) => int.parse(product.price))
          .reduce((a, b) => a + b);
    } else {
      subTotal = 0; // Set subTotal to 0 if the list is empty.
    }
    calculateTotalCostShipping();
    notifyListeners();
  }

  void calculateTotalCostShipping() {
    total = subTotal + 10;
    notifyListeners();
  }

  // void placeOrder(BuildContext context) {
  //   // Extract product IDs from the list of ProductsModel objects
  //   final List<String> productIds = list.map((product) => product.id).toList();
  //    final List<int> productCounts = list.map((product) => product.countOfOrder).toList();

  //   calculateTotalCost();

  //   // Call the SendOrder.placeOrder function to send the order data to Firestore
  //   SendOrder.placeOrder(context, productIds, total, subTotal,productCounts);

  //   // Clear the cart after placing the order
  //   list.clear();
  //   calculateTotalCost();

  //   notifyListeners();
  // }
  void placeOrder(BuildContext context) {
    // Extract product IDs from the list of ProductsModel objects
    final List<String> productIds = list.map((product) => product.id).toList();
    final List<String> vendorIds =
        list.map((product) => product.vendorId).toList();

    final List<int> productCounts =
        list.map((product) => product.countOfOrder).toList();

    calculateTotalCost();

    // Call the SendOrder.placeOrder function to send the order data to Firestore
    SendOrder.placeOrder(
      context,
      productIds,
      vendorIds,
      productCounts,
      total,
      subTotal,
    );

    // Clear the cart after placing the order
    list.clear();
    calculateTotalCost();

    notifyListeners();
  }
}
