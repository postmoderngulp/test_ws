import 'package:flutter/material.dart';

class SignInModel extends ChangeNotifier {
  String password = '';
  String email= '';
  bool passwordVal = false;
  bool emailVal = false;
  bool passwordObscure = true;
  bool isCheck = false;

  void setPassword(){
    passwordVal =  password.isNotEmpty ? true: false;
    notifyListeners();
  }

  void setEmail(){
    emailVal =
        RegExp(r'^[a-z0-9]+@[a-z0-9]+\.[a-z]{2,}$').hasMatch(email);
    notifyListeners();
  }

  setCheck(){
    isCheck = !isCheck;
    notifyListeners();
  }

  setPasswordObsc(){
    passwordObscure = !passwordObscure;
    notifyListeners();
  }
}