import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static  SharedPreferences? sharedPreferences;
  //CashHelper(this.sharedPreferences);

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(String key, bool value) async {
    return await sharedPreferences!.setBool('isDark', value);
  }

  bool? getData(String key) {
    return sharedPreferences!.getBool(key);
  }
}
