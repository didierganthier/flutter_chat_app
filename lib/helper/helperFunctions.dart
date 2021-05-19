import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {

  static String sharedPreferencesUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferencesUserNameKey = "ISLOGGEDIN";
  static String sharedPreferencesUserEmailKey = "ISLOGGEDIN";

  //saving data to SharedPreferences

  static Future<void> saveUserLoggedInSharePreference(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPreferencesUserLoggedInKey, isUserLoggedIn);
  }

  static Future<void> saveUserNameSharePreference(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferencesUserLoggedInKey, username);
  }

  static Future<void> saveUserEmailSharePreference(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferencesUserLoggedInKey, email);
  }

  //getting data to SharedPreferences

  static Future<void> getUserLoggedInSharePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(sharedPreferencesUserLoggedInKey);
  }

  static Future<void> getUserNameSharePreference(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferencesUserLoggedInKey);
  }

  static Future<void> getUserEmailSharePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferencesUserLoggedInKey);
  }
}