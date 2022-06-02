import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static getData({
    String? key,
  }) {
    return sharedPreferences.getString(key!);
  }

  static Future<bool> setData({
    String? key,
    dynamic value,
  })async {
    return await sharedPreferences.setString(key!, value);
  }
}
