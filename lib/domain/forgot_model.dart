import 'package:flutter/cupertino.dart';

class ForgotModel extends ChangeNotifier {
  String email= '';
  bool emailVal = false;
  void setEmail(){
    emailVal =
        RegExp(r'^[a-z0-9]+@[a-z0-9]+\.[a-z]{2,}$').hasMatch(email);
    notifyListeners();
  }
}