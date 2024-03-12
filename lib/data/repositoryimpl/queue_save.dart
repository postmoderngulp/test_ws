import 'package:shared_preferences/shared_preferences.dart';

class QueueSave {
  Future<void> load(List<String> queue, String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(key, queue);
  }

  Future<List<String>?> download(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final queue = sharedPreferences.getStringList(key);
    return queue;
  }
}
