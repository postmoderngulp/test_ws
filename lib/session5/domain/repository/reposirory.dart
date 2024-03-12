import '../entities/profile.dart';

abstract class Repository {
  Future<Profile> getProfile ();

  Future<List<Profile>> getProfiles();
}