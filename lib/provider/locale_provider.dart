
import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier{
  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }

  /// Display title value
  title(String value) {
    switch (value) {
      case 'en':
        return Text('English', style: TextStyle(fontSize: 16.0),);
      case 'bn':
        return Text('Bangla', style: TextStyle(fontSize: 16.0),);
      default:
        return Text('English', style: TextStyle(fontSize: 16.0),);
    }
  }
}