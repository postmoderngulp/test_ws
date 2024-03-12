// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_ws/session5/domain/entities/profile.dart';
import 'package:test_ws/session5/domain/repository/reposirory.dart';

class getProfileFromRepository {
  final Repository _repository;

  getProfileFromRepository({
    required  Repository repository,
  }) : _repository = repository;

  Future<Profile> getConcretProfile()async{
    final profile = await _repository.getProfile();
    return profile;
  }

  
}
