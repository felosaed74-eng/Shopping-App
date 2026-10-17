import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.backgroundGrey,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.black),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundGrey,
      contentPadding: const EdgeInsets.all(12),

      hintStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.grey,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.orangeLight),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.grey, width: 2),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.white, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.red, width: 2),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.red, width: 2),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),

      bodySmall: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),

      bodyMedium: TextStyle(
        fontSize: 18,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      ),

      labelMedium: TextStyle(
        fontSize: 14,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 40,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.backgroundGrey,
      selectedItemColor: AppColors.orangeLight,
      unselectedItemColor: AppColors.grey,

      selectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),

      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),

      selectedIconTheme: IconThemeData(size: 24),
    ),
  );
}
