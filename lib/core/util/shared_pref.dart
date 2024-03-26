import 'package:shared_preferences/shared_preferences.dart';


class SharedPref {
  static const String isLoggedInKey = 'isLoggedIn';
  static const String userKey = 'user';
  static const String tokenKey = 'token';
  static const String showChooseLanguage = 'choose_language_screen_shown';

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLoggedInKey, value);
  }

  static Future<void> clearShowChooseLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(showChooseLanguage);
  }

  static Future<void> saveChooseLanguageScreenShown(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(showChooseLanguage, value);
  }

  static Future<bool> isChooseLanguageScreenShown() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(showChooseLanguage) ?? false;
  }

  static Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenKey, token);
  }

  static Future<void> clearUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
  }

  static Future<void> clearToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey) ?? '';
  }

  static Future<void> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }


}
