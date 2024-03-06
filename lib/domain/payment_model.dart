import 'package:flutter/material.dart';

class PaymentModel extends ChangeNotifier {

  int val = 1;

  void setVal(int value){
    val = value;
    notifyListeners();
  }

}