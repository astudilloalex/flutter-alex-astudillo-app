import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  const AppThemeData._();

  static final ThemeData dark = ThemeData.dark().copyWith(
    useMaterial3: true,
  );

  static final ThemeData light = ThemeData.light().copyWith(
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      errorStyle: GoogleFonts.poppins(
        color: Colors.redAccent,
      ),
      labelStyle: GoogleFonts.poppins(),
    ),
    typography: Typography(
      black: TextTheme(
        bodyLarge: GoogleFonts.poppins(),
        bodyMedium: GoogleFonts.poppins(),
        bodySmall: GoogleFonts.poppins(),
        displayLarge: GoogleFonts.poppins(),
        displayMedium: GoogleFonts.poppins(),
        displaySmall: GoogleFonts.poppins(),
        headlineLarge: GoogleFonts.poppins(),
        headlineMedium: GoogleFonts.poppins(),
        headlineSmall: GoogleFonts.poppins(),
        labelLarge: GoogleFonts.poppins(),
        labelMedium: GoogleFonts.poppins(),
        labelSmall: GoogleFonts.poppins(),
        titleLarge: GoogleFonts.poppins(),
        titleMedium: GoogleFonts.poppins(),
        titleSmall: GoogleFonts.poppins(),
      ),
    ),
    tabBarTheme: const TabBarTheme(labelColor: Colors.white),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
