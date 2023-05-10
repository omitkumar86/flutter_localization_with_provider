
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class LocaleProvider with ChangeNotifier{
//   Locale _locale = const Locale('en');
//   Locale get locale => _locale;
//
//   void setLocale(Locale newLocale) {
//     _locale = newLocale;
//     notifyListeners();
//   }
// }



class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  SharedPreferences? _prefs;

  LocaleProvider() {
    _loadLocale();
  }

  Locale? get locale => _locale;

  Future<void> _loadLocale() async{
    final languageCode = _prefs?.getString('languageCode');
    if (languageCode == 'bn') {
      _locale = Locale('bn', 'BD');
    } else {
      _locale = Locale('en', 'US'); // Set English as the default locale
    }
    // final prefs = await _prefs;
    // final isLocale = prefs?.getString('languageCode') ?? false;
    // //_locale = isLocale == 'bn' ? Locale('bn') : Locale('en');
    //notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    await _prefs?.setString('languageCode', locale.languageCode);
    notifyListeners();
    // final prefs = await _prefs;
    // final isLocale = prefs?.getString('languageCode') ?? false;
    // await _prefs?.setString('languageCode', locale.languageCode);
    // //_locale = isLocale == 'bn'? Locale('bn') : Locale('en');
    // print("Check Localization State----------$_locale");
  }
}

