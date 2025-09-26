import 'package:flutter/material.dart' as material;
import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/services/shared_preferences_service.dart';

class ThemeModeController extends StateNotifier<material.ThemeMode> {
  ThemeModeController() : super(material.ThemeMode.system) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    try {
      final savedThemeMode = await SharedPreferencesService.getThemeMode();
      state = savedThemeMode;
    } catch (e) {
      // If there's an error loading, default to system theme
      state = material.ThemeMode.system;
    }
  }

  Future<void> toggle() async {
    final newThemeMode = state == material.ThemeMode.dark 
        ? material.ThemeMode.light 
        : material.ThemeMode.dark;
    
    state = newThemeMode;
    await SharedPreferencesService.setThemeMode(newThemeMode);
  }

  Future<void> setThemeMode(material.ThemeMode themeMode) async {
    state = themeMode;
    await SharedPreferencesService.setThemeMode(themeMode);
  }
}
