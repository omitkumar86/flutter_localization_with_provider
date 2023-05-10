// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ThemeProvider with ChangeNotifier {
//   ThemeData? _themeData;
//   final sharedPreferences = SharedPreferences.getInstance();
//
//   ThemeData? get themeData => _themeData;
//
//
//   void setThemeData(ThemeData themeData) {
//     _themeData = themeData;
//     final sharedPreferences = _themeData;
//     notifyListeners();
//   }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/theme/dark_theme.dart';
import '../utils/theme/light_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _themeData;
  final _prefs = SharedPreferences.getInstance();

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData? get themeData => _themeData;

  Future<void> _loadTheme() async {
    final prefs = await _prefs;
    final isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    _themeData = isDarkTheme ? darkTheme : lightTheme;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final prefs = await _prefs;
    final isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    await prefs.setBool('isDarkTheme', !isDarkTheme);
    _themeData = !isDarkTheme ? darkTheme : lightTheme;
    notifyListeners();
  }
}
