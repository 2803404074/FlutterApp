import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataUtils {
  // 保存数据
  static Future setUserInfo(String key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  // 获取数据
  static Future<String> getUserInfo(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  // 清除数据
  static Future deleteUserInfo(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }
}
