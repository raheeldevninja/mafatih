import 'package:flutter/material.dart';
import 'package:mafatih/core/util/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocaleProvider extends ChangeNotifier {
  late Locale _appLocale;

  LocaleProvider() {
    _appLocale = const Locale('en');
    _loadSavedLocale();
  }

  Locale get appLocale => _appLocale;

  void changeLocale(Locale newLocale) {
    if (_appLocale != newLocale) {
      _appLocale = newLocale;
      _saveLocale(newLocale);
      notifyListeners();
    }
  }

  Future<void> _loadSavedLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString('language_code');
    if (languageCode != null) {
      _appLocale = Locale(languageCode);
      notifyListeners();
    }
  }

  Future<void> _saveLocale(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
  }

  Future<void> saveChooseLanguageShown() async {
    await SharedPref.saveChooseLanguageScreenShown(true);
  }

  Future<bool> isChooseLanguageScreenShown() async {
    return await SharedPref.isChooseLanguageScreenShown();
  }
}
