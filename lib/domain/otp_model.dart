import 'package:flutter/cupertino.dart';

class OtpModel extends ChangeNotifier{
  String code = '';
  bool codeVal = false;

  void setVal(){
    codeVal = code.length == 6 ? true : false;
    notifyListeners();
  }
}