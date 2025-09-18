import 'package:flutter/material.dart';
import 'package:job_listing_app/src/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surfaceLight,
      background: AppColors.backgroundLight,
      onSurface: AppColors.textLight,
      onBackground: AppColors.textLight,
      onPrimary: Colors.white,
      error: AppColors.error,
      onError: Colors.white,
    ),

    scaffoldBackgroundColor: AppColors.backgroundLight,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceLight,
      foregroundColor: AppColors.textLight,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(color: AppColors.textLight, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: TextStyle(color: AppColors.textSecondaryLight),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.textLight, fontSize: 24, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: AppColors.textLight, fontSize: 20, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(color: AppColors.textLight, fontSize: 18, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(color: AppColors.textLight, fontSize: 16, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(color: AppColors.textLight, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textLight, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.textSecondaryLight, fontSize: 12),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surfaceDark,
      background: AppColors.backgroundDark,
      onSurface: AppColors.textDark,
      onBackground: AppColors.textDark,
      onPrimary: Colors.white,
      error: AppColors.error,
      onError: Colors.white,
    ),

    scaffoldBackgroundColor: AppColors.backgroundDark,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: AppColors.textDark,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(color: AppColors.textDark, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade600),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade600),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: TextStyle(color: AppColors.textSecondaryDark),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.textDark, fontSize: 24, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: AppColors.textDark, fontSize: 20, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(color: AppColors.textDark, fontSize: 18, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(color: AppColors.textDark, fontSize: 16, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(color: AppColors.textDark, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textDark, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.textSecondaryDark, fontSize: 12),
    ),
  );
}
