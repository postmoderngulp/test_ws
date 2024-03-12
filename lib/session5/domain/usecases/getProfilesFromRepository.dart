// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:test_ws/session5/data/repositoryimpl/repositoryImpl.dart';
import 'package:test_ws/session5/domain/entities/profile.dart';

class GetProfilesFromRepository {
  final RepositoryImpl _repo;

  GetProfilesFromRepository({
    required RepositoryImpl repo,
  }) : _repo = repo;

Future<List<Profile>> getProfiles()async{
    final profiles = await _repo.getProfiles();
    return profiles;
  }

  List<Profile> searchProfile(String text,List<Profile> profiles){
      return profiles.where((element) => element.name.toLowerCase().contains(text)).toList();
  }



  }
