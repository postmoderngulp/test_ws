import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/ProfileModel.dart';
import '../../domain/entities/profile.dart';

abstract class RemoteDataSource {
  Future<Profile> getProfile();

  Future<List<Profile>> getProfiles();
}


class RemoteDataSourceImpl implements RemoteDataSource {
  final _supabase = Supabase.instance.client;

  @override
  Future<Profile> getProfile() async{
  final maps =  await _supabase.from('profiles').select().eq('user_id', _supabase.auth.currentSession!.user.id);
   final val =  ProfileMoodel.fromMap(maps.first);
   return val;
  }
  
  @override
  Future<List<Profile>> getProfiles() async {
    final maps =  await _supabase.from('profiles').select().neq('user_id', _supabase.auth.currentSession!.user.id);
    List<Profile> profiles = [];
    for(int i = 0;i < maps.length;i++){
      profiles.add(ProfileMoodel.fromMap(maps[i]));
    }
    return profiles;
  }

}