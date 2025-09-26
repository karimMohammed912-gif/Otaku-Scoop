import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _onboardingCompletedKey = 'onboarding_completed';
  static const String _themeModeKey = 'theme_mode';

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception('SharedPreferencesService not initialized. Call init() first.');
    }
    return _prefs!;
  }

  // Onboarding methods
  static Future<bool> isOnboardingCompleted() async {
    return prefs.getBool(_onboardingCompletedKey) ?? false;
  }

  static Future<void> setOnboardingCompleted(bool completed) async {
    await prefs.setBool(_onboardingCompletedKey, completed);
  }

  // Theme methods
  static Future<ThemeMode> getThemeMode() async {
    final themeModeIndex = prefs.getInt(_themeModeKey);
    if (themeModeIndex == null) {
      return ThemeMode.system; // Default to system theme
    }
    return ThemeMode.values[themeModeIndex];
  }

  static Future<void> setThemeMode(ThemeMode themeMode) async {
    await prefs.setInt(_themeModeKey, themeMode.index);
  }

  // Clear all preferences (useful for testing or reset)
  static Future<void> clearAll() async {
    await prefs.clear();
  }
}
