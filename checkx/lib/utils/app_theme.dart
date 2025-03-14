import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF3B1C32);
  static const Color accent = Color(0xFFA64D79);
  static const Color whiteText = Color(0xFFFFFFFF);
  static const Color secondaryColor = Color(0xFF6A1E55);
  static const Color backgroundColor = Color(0xFF1A1A1D);

  // Page Padding
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: 16);

  // Text Styles
  static const TextStyle displayText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: "RedHatDisplay",
    color: whiteText,
  );

  static const TextStyle headingText22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: "RedHatDisplay",
    color: whiteText,
  );

  static const TextStyle headingText18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: "RedHatDisplay",
    color: whiteText,
  );

  static const TextStyle bodyTextLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontFamily: "RedHatDisplay",
    color: whiteText,
  );

  static const TextStyle bodyTextMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: "RedHatDisplay",
    color: whiteText,
  );

  static const TextStyle bodyTextSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: "RedHatDisplay",
    color: whiteText,
  );

  static const TextStyle labelTextLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: "RedHatDisplay",
    color: whiteText,
  );

  static const TextStyle labelTextMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: "RedHatDisplay",
    color: whiteText,
  );

  static const TextStyle labelTextSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: "RedHatDisplay",
    color: whiteText,
  );

  // ThemeData for the app
  static final ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: "RedHatDisplay",
    textTheme: const TextTheme(
      displayLarge: displayText,
      headlineMedium: headingText22,
      headlineSmall: headingText18,
      bodyLarge: bodyTextLarge,
      bodyMedium: bodyTextMedium,
      bodySmall: bodyTextSmall,
      labelLarge: labelTextLarge,
      labelMedium: labelTextMedium,
      labelSmall: labelTextSmall,
    ),
  );
}
