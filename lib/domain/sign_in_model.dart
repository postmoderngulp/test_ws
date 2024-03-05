import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_ws/presentation/Home.dart';
import 'package:test_ws/repository/supabase_service.dart';

class SignInModel extends ChangeNotifier {
  String password = '';
  String email= '';
  bool isLoad = false;
  String connective = '';
  String? error;
  bool passwordVal = false;
  bool emailVal = false;
  bool passwordObscure = true;
  bool isCheck = false;
  TextEditingController controller = TextEditingController();

  void setPassword(){
    passwordVal =  password.isNotEmpty ? true: false;
    notifyListeners();
  }

  SignInModel(){
    _setup();
  }

  void _setup(){
     Connectivity().checkConnectivity().then((value) {
      connective = value.name;
      notifyListeners();
    });
    Connectivity().onConnectivityChanged.listen((event) { 
      connective = event.name;
      notifyListeners();
    });
    _setupCheck();
  }

    void setLoad(){
    isLoad = true;
    notifyListeners();
  }

  void setEmail(){
    emailVal =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.(ru)$').hasMatch(email);
    notifyListeners();
  }

   void signIn(BuildContext context)async{
    try{
    SupabaseService service = SupabaseService();
    await service.signIn(email, password).then((value) => goHome(context));
    await service.signOut();
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

   void googleSignIn(BuildContext context) async{
     SupabaseService service = SupabaseService();
     await service.googleSignIn().then((value) => goHome(context));
  }

  void goHome(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
  }
  
  void _setupCheck() async{
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    final hash = await secureStorage.read(key: 'hashPswrd');
    isCheck = hash == null ? false : true;
    notifyListeners();
  }

  void savePassword() async{
    if(isCheck){
      FlutterSecureStorage secureStorage = const FlutterSecureStorage();
      await secureStorage.write(key: 'hashPswrd', value: null);
      isCheck = !isCheck;

    }
    else if (!isCheck && password.isNotEmpty){
      FlutterSecureStorage secureStorage = const FlutterSecureStorage(); 
   final bytes = utf8.encode(password);
   final encodePswrd = sha512.convert(bytes);
   await secureStorage.write(key: 'hashPswrd', value: encodePswrd.toString());
   isCheck = !isCheck;
    }
   notifyListeners();

  }

  

  setPasswordObsc(){
    passwordObscure = !passwordObscure;
    notifyListeners();
  }
}