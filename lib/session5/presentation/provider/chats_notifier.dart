// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_ws/session5/domain/entities/profile.dart';
import 'package:test_ws/session5/domain/usecases/getProfilesFromRepository.dart';

class ChatsNotifier extends ChangeNotifier {
  final GetProfilesFromRepository _usecase;
  List<Profile> _profiles = [];
  List<Profile> profiles = [];


  ChatsNotifier({
    required GetProfilesFromRepository usecase,
  }) : _usecase = usecase{
    getProfiles();
  }

  void getProfiles() async {
    final listVal =  await _usecase.getProfiles();
    _profiles = listVal;
    profiles = _profiles;
    notifyListeners();
  }


  void search(String text){
    profiles = _usecase.searchProfile(text, _profiles);
    notifyListeners();
  }
  
}
