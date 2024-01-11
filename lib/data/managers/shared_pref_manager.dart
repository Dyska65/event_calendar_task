import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static Future save({required String key, required List<String> value}) async {
    final localManager = await SharedPreferences.getInstance();
    await localManager.setStringList(key, value);
  }

  static Future<dynamic> get({required String key}) async {
    final localManager = await SharedPreferences.getInstance();
    return localManager.get(key);
  }

  static removeByKey({required String key}) async {
    final localManager = await SharedPreferences.getInstance();
    await localManager.remove(key);
  }
}
