import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _themeData;

  ThemeData? get themeData => _themeData;

  void setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
