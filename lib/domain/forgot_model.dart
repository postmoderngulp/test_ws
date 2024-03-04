import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class ForgotModel extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  String email= '';
  bool emailVal = false;
  

  void setEmail(){
    emailVal =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.(ru)$').hasMatch(email);
    notifyListeners();
  }
}