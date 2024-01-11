import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = darkTheme;

  ThemeProvider(bool isDark) {
    if (isDark) {
      themeData = darkTheme;
    } else {
      themeData = lightTheme;
    }
  }

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() async {
    SharedPreferences themeSettings = await SharedPreferences.getInstance();
    if (_themeData == lightTheme) {
      themeData = darkTheme;
      themeSettings.setBool('is_dark', true);
    } else {
      themeData = lightTheme;
      themeSettings.setBool('is_dark', false);
    }
  }
}
