import 'package:flutter/material.dart';

class SignUpModel extends ChangeNotifier {
  String name = '';
  String number = '';
  String email= '';
  String password = '';
  String confirmPassword = '';

  bool isCheck = false;
  bool passwordObscure = true;
  bool confirmObscure = true;
  bool nameVal = false;
  bool numberVal = false;
  bool emailVal = false;
  bool passwordVal = false;
  bool confirmPasswordVal = false;


  void setName(){
    nameVal =  name.isNotEmpty ? true: false;
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
  setConfirmObsc(){
    confirmObscure = !confirmObscure;
    notifyListeners();
  }



  void setNumber(){
    numberVal =  number.isNotEmpty ? true: false;
    notifyListeners();
  }void setEmail(){
    emailVal =
        RegExp(r'^[a-z0-9]+@[a-z0-9]+\.[a-z]{2,}$').hasMatch(email);
    notifyListeners();
  }void setPassword(){
    passwordVal =  password.isNotEmpty ? true: false;
    notifyListeners();
  }void setConfirm(){
    confirmPasswordVal =  password == confirmPassword ? true: false;
    notifyListeners();
  }





}