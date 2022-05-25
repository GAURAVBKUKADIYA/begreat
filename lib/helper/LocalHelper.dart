import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper
{
  static void storeIslogin(val) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("islogin", val);
  }

  static void storeName(val) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", val);
  }
  static void storeid(val) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("id", val);
  }

  static Future<String> readIslogin() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var islogin = prefs.getString("islogin");
    return islogin;
  }

  static void clearAll() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
  static void clearOne(name) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(name);
  }
}