import 'package:flutter/material.dart';

class ThemeStateNotifier extends ChangeNotifier {
  //
  bool isDarkMode = false;

  void updateTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
