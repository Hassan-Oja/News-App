import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // data
  ThemeMode currentTheme = ThemeMode.light;

  // change theme
  void changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) {
      return;
    }
    currentTheme = newTheme;
    notifyListeners();
  }
}