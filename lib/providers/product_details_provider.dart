import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  String image = '';
  String get getImage => image;
  int selectedIndex = -1;
  int get getSelectedIndex => selectedIndex;

  int sizeIndex = -1;
  int get getSizeIndex => sizeIndex;
  void setImage(String imagelink, int index) {
    image = imagelink;
    selectedIndex = index;
    notifyListeners();
  }

  void setSize(int size) {
    sizeIndex = size;
    notifyListeners();
  }
}
