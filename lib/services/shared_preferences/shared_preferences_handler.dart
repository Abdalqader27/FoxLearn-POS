import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {
  static Future<bool> getBool({required String key}) async {
    final sPrefs = await SharedPreferences.getInstance();
    return sPrefs.getBool(key) ?? false;
  }

  static Future<int> getInteger({required String key}) async {
    final sPrefs = await SharedPreferences.getInstance();
    return sPrefs.getInt(key) ?? 0;
  }

  static Future<String?> getString({required String key}) async {
    final sPrefs = await SharedPreferences.getInstance();
    return sPrefs.getString(key);
  }

  static Future<double> getDouble({required String key}) async {
    final sPrefs = await SharedPreferences.getInstance();
    return sPrefs.getDouble(key) ?? 0.0;
  }

  static set({String? key, var value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) await prefs.setString(key!, value);
    if (value is bool) await prefs.setBool(key!, value);
    if (value is double) await prefs.setDouble(key!, value);
    if (value is int) await prefs.setInt(key!, value);
  }

  static remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static clearShared() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
