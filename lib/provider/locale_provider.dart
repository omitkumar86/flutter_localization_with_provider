
import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier{
  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}