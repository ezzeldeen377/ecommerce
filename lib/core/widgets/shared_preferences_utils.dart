import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> set(String key, dynamic value) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    return false;
  }

  static Object? get(String key) {
    return sharedPreferences.get(key);
  }

  static Future<bool> remove(String key) async {
    return await sharedPreferences.remove(key);
  }
}
