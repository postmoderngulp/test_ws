
import 'package:flutter/material.dart';

class OtpModel extends ChangeNotifier{
  String code = '';
  bool codeVal = false;

  void setVal(){
    codeVal = code.length == 6 ? true : false;
    notifyListeners();
  }


  void setCode(String value){
   if( value.length > 6 ) return;
    code = value;
    notifyListeners();
  }
}