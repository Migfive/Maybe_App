import 'package:flutter/material.dart';

class AppTheme {
  bool isDarkMode;
  AppTheme({required this.isDarkMode});
  ThemeData them() {
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        foregroundColor: isDarkMode ? Colors.white : Colors.black,
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black),
        iconTheme: IconThemeData(
            color: isDarkMode ? Colors.white : Colors.black, size: 24),
        elevation: 4,
      ),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black, fontSize: 15)),
    );
  }
}
