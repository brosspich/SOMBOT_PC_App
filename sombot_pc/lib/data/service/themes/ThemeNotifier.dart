// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/themes/app_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  late ThemeData _currentTheme;
  late SharedPreferences _prefs;

  ThemeNotifier() {
    _loadTheme();
  }

  ThemeData get currentTheme => _currentTheme;
  bool get isDarkMode => _currentTheme.brightness == Brightness.dark;

  Future<void> _loadTheme() async {
    _prefs = await SharedPreferences.getInstance();
    bool isDark = _prefs.getBool('isDarkMode') ?? false;
    _currentTheme = isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _currentTheme = isDarkMode ? AppTheme.lightTheme : AppTheme.darkTheme;
    await _prefs.setBool('isDarkMode', !isDarkMode);
    notifyListeners();
  }

  Future<void> setTheme(bool isDark) async {
    _currentTheme = isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
    await _prefs.setBool('isDarkMode', isDark);
    notifyListeners();
  }
}
