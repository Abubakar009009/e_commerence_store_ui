import 'package:flutter/material.dart';

class SendDataAdminProvider extends ChangeNotifier {
  bool issending = false;

  bool get getisSending => issending;
  void dataSending() {
    issending = true;
    notifyListeners();
  }

  void dataSendingComplete() {
    issending = false;
    notifyListeners();
  }
}
