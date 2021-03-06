import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  // ThemeNotifier() {
  //   _darkTheme = true;
  //   _loadFromPrefs();
  // }

  String key = "darkTheme";
  bool _darkTheme;
  SharedPreferences _preferences;
  bool get darkTheme => _darkTheme;
  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_preferences == null) {
      await SharedPreferences.getInstance();
    }
  }

  loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _preferences.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _darkTheme = await _preferences.setBool(key, _darkTheme);
    notifyListeners();
  }
}
