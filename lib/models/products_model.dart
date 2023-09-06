import 'package:e_commerence_store_ui/models/review_model.dart';

class ProductsModel {
  final String name;
  final String category;
  final String price;
  final List<String> imageLink;
  final String description;
  final List<ReviewModel> reviews;
  final String totalPrice;
  String approval;
  String id;

  ProductsModel({
    required this.name,
    required this.description,
    required this.totalPrice,
    required this.reviews,
    required this.imageLink,
    required this.category,
    required this.price,
    this.approval = '',
    this.id = '',
  });
}
