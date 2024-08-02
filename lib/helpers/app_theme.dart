import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define your colors
  static const Color primaryColor = Color(0xFF2284e1);
  static const Color secondaryColor = Color(0xFF0bfb90);
  static const Color borderColor = Color(0xFFdefdef);
  static const Color navBarColor = Color(0xFFc9f8ef);
  static const Color homeBackground = Color(0xFFc9f8ef);
  static const Color textColorBlack = Colors.black;
  static const Color textColorWhite = Colors.white;

  // Define your text styles
  static final TextStyle textStyle = GoogleFonts.overpass(
    color: textColorBlack,
    fontSize: 16,
  );

  // Define your theme
  static final ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    textTheme: TextTheme(
      bodyLarge: textStyle,
      bodyMedium: textStyle,
      displayLarge:
          textStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
      displayMedium:
          textStyle.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
      displaySmall:
          textStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      headlineMedium:
          textStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
      headlineSmall:
          textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      titleLarge: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: textStyle.copyWith(
        color: textColorWhite,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: textColorWhite,
        backgroundColor: primaryColor,
        textStyle: textStyle.copyWith(color: textColorWhite),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: primaryColor, width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: primaryColor, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: primaryColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.red, width: 0.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.red, width: 0.5),
      ),
    ),
  );
}
