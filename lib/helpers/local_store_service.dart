import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreHelper {
  static final LocalStoreHelper _instance = LocalStoreHelper._();

  LocalStoreHelper._();

  static LocalStoreHelper get instance => _instance;

  Future<List<String>> getList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  Future<bool> setList(String key, List<String> list) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, list);
  }

  Future<String?> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }
}
