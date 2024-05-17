import 'dart:convert';

import 'package:mafatih/core/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String isLoggedInKey = 'isLoggedIn';
  static const String userKey = 'user';
  static const String tokenKey = 'token';
  static const String showChooseLanguage = 'choose_language_screen_shown';
  static const String isLoginSkippedKey = 'login_skipped';

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLoggedInKey, value);
  }

  static Future<void> setLoginSkipped(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLoginSkippedKey, value);
  }

  static Future<bool> isLoginSkipped() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoginSkippedKey) ?? false;
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

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey) ?? '';
  }


  static Future<void> clearToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }

  static Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userKey, json.encode(user.toJson()));
  }

  static Future<User?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userString = prefs.getString(userKey);
    if (userString != null) {
      return User.fromJson(json.decode(userString) as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  static Future<void> clearUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
  }


  static Future<void> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(userKey);
    prefs.remove(tokenKey);
    prefs.remove(isLoggedInKey);
    prefs.remove(isLoginSkippedKey);
  }
}
