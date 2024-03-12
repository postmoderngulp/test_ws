// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_ws/session5/data/datasource/remote_data_source.dart';
import 'package:test_ws/session5/domain/entities/profile.dart';
import 'package:test_ws/session5/domain/repository/reposirory.dart';

class RepositoryImpl implements Repository {
  RemoteDataSource _source;

  RepositoryImpl({
    required  RemoteDataSource source,
  }) : _source = source;

  @override
  Future<Profile> getProfile() async{
   final val =  await _source.getProfile();
   return val;
  }
  
  @override
  Future<List<Profile>> getProfiles()async {
   final list = await _source.getProfiles();
    return list;
  }

}
