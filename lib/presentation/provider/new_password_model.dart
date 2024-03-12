import 'package:flutter/cupertino.dart';

class NewPasswordModel extends ChangeNotifier {
  String password = '';
  String confirmPassword = '';
  bool passwordObscure = true;
  bool confirmObscure = true;
  bool passwordVal = false;
  bool confirmPasswordVal = false;

  setPasswordObsc(){
    passwordObscure = !passwordObscure;
    notifyListeners();
  }
  setConfirmObsc(){
    confirmObscure = !confirmObscure;
    notifyListeners();
  }

  void setPassword(){
    passwordVal =  password.isNotEmpty ? true: false;
    notifyListeners();
  }void setConfirm(){
    confirmPasswordVal =  password == confirmPassword ? true: false;
    notifyListeners();
  }
}