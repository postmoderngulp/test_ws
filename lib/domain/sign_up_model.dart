import 'dart:io';import 'package:path/path.dart' as path;

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_ws/presentation/Home.dart';
import 'package:test_ws/presentation/sign_in.dart';
import 'package:test_ws/repository/supabase_service.dart';

class SignUpModel extends ChangeNotifier {
  String name = '';
  String number = '';
  String email= '';
  String password = '';
  String confirmPassword = '';
  String pdfPath = '';
  bool isLoad = false;
  TextEditingController controller = TextEditingController();


  String connective = '';
  String? error;
  bool isCheck = false;
  bool passwordObscure = true;
  bool confirmObscure = true;
  bool nameVal = false;
  bool numberVal = false;
  bool emailVal = false;
  bool passwordVal = false;
  bool confirmPasswordVal = false;



  SignUpModel(){
    _setup();
  }

  void setLoad(){
    isLoad = true;
    notifyListeners();
  }

  void _setup() async{
    Connectivity().checkConnectivity().then((value) {
      connective = value.name;
      notifyListeners();
    });
    Connectivity().onConnectivityChanged.listen((event) { 
      connective = event.name;
      notifyListeners();
    });
    ByteData byteData = await rootBundle.load('assets/pdf.pdf');
    Directory directory = await getApplicationDocumentsDirectory();

    File file  = File(path.join(directory.path,'pdf.pdf'));

    await file.writeAsBytes(byteData.buffer.asUint8List());
    pdfPath = file.path;
    notifyListeners();
  }

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


  void signUp(BuildContext context)async{
    try{
    SupabaseService service = SupabaseService();
    await service.signUp(email, password,number,name).then((value) => goSignIn(context));
    isLoad = false;
    notifyListeners();
    }
    catch(e){
      isLoad = false;
      error = e.toString();
      print(e);
      notifyListeners();
    }

  }


  void goSignIn(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignIn()));
  }

  void googleSignIn(BuildContext context) async{
     SupabaseService service = SupabaseService();
     await service.googleSignIn().then((value) => goHome(context));
  }

  void goHome(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
  }

  void setNumber(){
    numberVal =  number.isNotEmpty ? true: false;
    notifyListeners();
  }
  void setEmail(){
    emailVal =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.(ru)$').hasMatch(email);
    notifyListeners();
  }
  void setPassword(){
    passwordVal =  password.isNotEmpty ? true: false;
    notifyListeners();
  }
  void setConfirm(){
    confirmPasswordVal =  password == confirmPassword ? true: false;
    notifyListeners();
  }





}