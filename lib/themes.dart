import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    return themeMode == ThemeMode.dark;

  }


  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}


class MyThemes {

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black87,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.grey.shade400, opacity: 0.8),
    splashColor: Colors.white,

  );
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.grey.shade400, opacity: 0.8),
    splashColor: Colors.black87,
  );
}