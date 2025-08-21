import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF0A2342); // Azul marino
  static const Color primaryLight = Color(0xFF274472);
  static const Color primaryDark = Color(0xFF07162B);
  static const Color secondaryColor = Color(0xFF185ADB);
  static const Color backgroundColor = Color(0xFFF5F7FA);
  static const Color surfaceColor = Color(0xFFE3E9F3);
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.white;
  static const Color onBackground = Color(0xFF0A2342);
  static const Color onSurface = Color(0xFF0A2342);
}

class AppTextStyles {
  static const TextStyle header = TextStyle(
    fontFamily: "Poppins",
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.onBackground,
    height: 1.2,
    letterSpacing: 1.5,
  );

  static const TextStyle description = TextStyle(
    fontFamily: "Sans",
    fontSize: 16,
    color: Colors.black87,
    letterSpacing: 1.2,
    wordSpacing: 2,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle label = TextStyle(
    fontFamily: "Poppins",
    color: AppColors.onBackground,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static const TextStyle hint = TextStyle(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}

class AppShadowStyle {
  static List<BoxShadow> generalShadow = [
    const BoxShadow(
      color: Color(0x26AAA9A9),
      blurRadius: 8,
      spreadRadius: 2,
      offset: Offset(0, 6),
    )
  ];

  static List<BoxShadow> btnShadow = [
    const BoxShadow(
      color: Color(0x26AAA9A9),
      blurRadius: 5,
      spreadRadius: 1,
      offset: Offset(0, 0),
    )
  ];

  static List<BoxShadow> containerShadow = [
    BoxShadow(
        color: Colors.black.withAlpha(128),
        blurRadius: 10,
        spreadRadius: -3,
        offset: const Offset(0, 0))
  ];
  static List<BoxShadow> containerImageShadow = [
    BoxShadow(
        color: Colors.black.withAlpha(128),
        blurRadius: 7,
        spreadRadius: -3,
        offset: const Offset(0, -1))
  ];
}