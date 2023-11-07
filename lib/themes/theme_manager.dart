import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeManager extends GetxController {
  ThemeMode _themeMode = Get.isPlatformDarkMode? ThemeMode.dark : ThemeMode.light;
  var isDark = false;
  get themeMode => _themeMode;

  toggleTheme(bool state) {
    if (state == true) {
      Get.changeThemeMode(ThemeMode.dark);
      _themeMode = ThemeMode.dark;
      isDark = true;
    } else {
      Get.changeThemeMode(ThemeMode.light);
      _themeMode = ThemeMode.dark;
      isDark = false;
    }
    update();
  }
}