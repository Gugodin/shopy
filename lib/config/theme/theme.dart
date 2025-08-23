import 'package:flutter/material.dart';
import 'package:shopy/config/styles/styles.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: AppColors.primaryColor,
    primaryContainer: AppColors.primaryLight,
    secondary: AppColors.secondaryColor,
    secondaryContainer: AppColors.primaryLight,
    surface: AppColors.surfaceColor,
    error: Colors.red.shade700,
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onSurface: AppColors.onSurface,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.onPrimary,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.secondaryColor,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.onSecondary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.primaryLight),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
  ),
  cardColor: AppColors.surfaceColor,
  iconTheme: IconThemeData(
    color: AppColors.primaryColor,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.onBackground),
    bodyMedium: TextStyle(color: AppColors.onBackground),
    titleLarge:
        TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
  ),
);
