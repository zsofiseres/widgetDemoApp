import 'package:flutter/material.dart';

class ThemeViewModel with ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.system;

  ThemeMode get currentTheme => _currentTheme;

  bool isOn = false;

  void setTheme(ThemeMode mode) {
    _currentTheme = mode;
    notifyListeners();
  }

  void onSwitchChanged(bool newValue) {
    isOn = newValue;
    notifyListeners();
  }
}
