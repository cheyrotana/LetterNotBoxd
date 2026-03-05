import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF1A1A1A);
  static const surface = Color(0xFF2C2C2C);
  static const primary = Color(0xFF00C030); // Letterboxd green
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFF9A9A9A);
  static const card = Color(0xFF242424);
}

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.surface,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      bodyMedium: TextStyle(color: AppColors.textSecondary),
    ),
  );
}
