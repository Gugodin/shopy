import 'package:flutter/material.dart';
import 'package:shopy/config/styles/styles.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: AppColors.primaryColor,
    primaryContainer: AppColors.primaryLight,
    secondary: AppColors.secondaryColor,
    secondaryContainer: AppColors.primaryLight,
    surface: AppColors.surfaceColor,
    error: Colors.red.shade400,
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onSurface: AppColors.onSurface,
    onError: Colors.black,
    brightness: Brightness.dark,
  ),
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.surfaceColor,
    foregroundColor: AppColors.onBackground,
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
    // Grandes títulos para pantallas (Hero texts)
    displayLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 57,
      fontWeight: FontWeight.w800,
      color: AppColors.onBackground,
      letterSpacing: -0.25,
    ),
    displayMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 45,
      fontWeight: FontWeight.w700,
      color: AppColors.onBackground,
      letterSpacing: 0,
    ),
    displaySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: AppColors.onBackground,
      letterSpacing: 0.25,
    ),

    // Headlines (secciones importantes)
    headlineLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.onBackground,
    ),
    headlineMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.onBackground,
    ),
    headlineSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.onBackground,
    ),

    // Títulos intermedios
    titleLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    ),
    titleMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.onBackground,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.onBackground,
      letterSpacing: 0.1,
    ),

    // Cuerpo de texto
    bodyLarge: TextStyle(
      fontFamily: "Sans",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Sans",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontFamily: "Sans",
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white60,
      letterSpacing: 0.4,
    ),

    // Etiquetas y botones
    labelLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.secondaryColor,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: Colors.white60,
      letterSpacing: 0.5,
    ),
  ),
);