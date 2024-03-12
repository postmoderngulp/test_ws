// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_ws/session5/domain/entities/profile.dart';

import 'package:test_ws/session5/domain/usecases/getProfileFromRepository.dart';



class HomeNotifier extends ChangeNotifier {
  getProfileFromRepository _usecase;
  Profile? profile;


  HomeNotifier({
    required getProfileFromRepository  usecase,
  }) : _usecase = usecase{
    getProfile();
  }

  void getProfile() async{
    final value = await _usecase.getConcretProfile();
    profile = value;
    notifyListeners();
  }
    
  
}
