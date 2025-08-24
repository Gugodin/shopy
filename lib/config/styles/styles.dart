import 'package:flutter/material.dart';

class AppColors {
  // Base (dark + mint accent)
  static const Color primaryColor = Color(0xFF00BFA6); // Verde menta fuerte
  static const Color primaryLight = Color(0xFF4CFFE6); // Verde menta claro
  static const Color primaryDark = Color(0xFF008C77); // Verde menta oscuro

  static const Color secondaryColor = Color(0xFF26C6DA); // Cian-menta

  // Fondo y superficies (tema oscuro)
  static const Color backgroundColor = Color(0xFF121212); // Dark background
  static const Color surfaceColor = Color(0xFF1E1E1E); // Superficie gris oscura

  // Texto sobre cada color
  static const Color onPrimary = Colors.black; // contraste sobre menta
  static const Color onSecondary = Colors.black;
  static const Color onBackground = Colors.white;
  static const Color onSurface = Colors.white;
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
    color: Colors.white70,
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
      color: Color(0x6600BFA6), // sombra con tinte menta
      blurRadius: 8,
      spreadRadius: 2,
      offset: Offset(0, 6),
    )
  ];

  static List<BoxShadow> btnShadow = [
    const BoxShadow(
      color: Color(0x3300BFA6), // sombra ligera menta
      blurRadius: 5,
      spreadRadius: 1,
      offset: Offset(0, 0),
    )
  ];

  static List<BoxShadow> containerShadow = [
    BoxShadow(
      color: Colors.black.withAlpha(180),
      blurRadius: 10,
      spreadRadius: -3,
      offset: const Offset(0, 0),
    )
  ];

  static List<BoxShadow> containerImageShadow = [
    BoxShadow(
      color: Colors.black.withAlpha(160),
      blurRadius: 7,
      spreadRadius: -3,
      offset: const Offset(0, -1),
    )
  ];
}