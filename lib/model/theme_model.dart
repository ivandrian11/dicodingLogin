import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  ThemeMode _mode;

  ThemeModel({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  ThemeMode get mode => _mode;

  void toggleMode(bool isLight) {
    _mode = isLight ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
