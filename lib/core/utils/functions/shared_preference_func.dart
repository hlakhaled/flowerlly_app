import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceFunc {
  static String key = "Account";
  static set(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, status);
  }

  static setName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
  }

  static getName() async {
    final prefs = await SharedPreferences.getInstance();
    
   return prefs.getString("name") ?? "";
  }

  static Future<bool> get() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static  setId(String id) async {
    final prefs = await SharedPreferences.getInstance();
     prefs.setString("id", id);
  }

  static Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("id") ?? "";
  }
}
