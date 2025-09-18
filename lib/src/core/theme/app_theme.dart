import 'package:flutter/material.dart';
import 'package:job_listing_app/src/core/constants/app_colors.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: AppColors.primarySwatch,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.textPrimary,
      onPrimary: AppColors.textOnPrimary,
      onSecondary: Colors.white,
      error: AppColors.error,
      onError: Colors.white,
      onSurfaceVariant: AppColors.textSecondary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.textPrimary, fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: AppColors.textPrimary, fontSize: 28, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textPrimary, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.textSecondary, fontSize: 12),
      labelLarge: TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(color: AppColors.textSecondary, fontSize: 10, fontWeight: FontWeight.w500),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.primary, foregroundColor: Colors.white, elevation: 2, centerTitle: true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    cardTheme: const CardThemeData(
      color: AppColors.surfaceLight,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: AppColors.primarySwatch,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textOnDark,
      onPrimary: AppColors.textOnPrimary,
      onSecondary: Colors.black,
      error: AppColors.error,
      onError: Colors.white,
      onSurfaceVariant: Colors.grey.shade400,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.textOnDark, fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: AppColors.textOnDark, fontSize: 28, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(color: AppColors.textOnDark, fontSize: 24, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: AppColors.textOnDark, fontSize: 24, fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(color: AppColors.textOnDark, fontSize: 20, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(color: AppColors.textOnDark, fontSize: 18, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(color: AppColors.textOnDark, fontSize: 18, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(color: AppColors.textOnDark, fontSize: 16, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(color: AppColors.textOnDark, fontSize: 14, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(color: AppColors.textOnDark, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textOnDark, fontSize: 14),
      bodySmall: TextStyle(color: Colors.grey, fontSize: 12),
      labelLarge: TextStyle(color: AppColors.textOnDark, fontSize: 14, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(color: AppColors.textOnDark, fontSize: 12, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.surfaceDark, foregroundColor: Colors.white, elevation: 2, centerTitle: true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    cardTheme: const CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    ),
  );
}
