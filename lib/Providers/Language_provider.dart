import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  // todo : data
  String currentLanguage = 'en';

  // change Languge
  void changeLanguage(String newLanguage) {
    if (newLanguage == currentLanguage) {
      return;
    }
    currentLanguage = newLanguage;
    notifyListeners();
  }
}
