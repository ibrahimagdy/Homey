import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static Color primaryColor = const Color(0xff0A1128);
  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      primary: primaryColor,
      seedColor: primaryColor,
      secondary: Colors.white,
    ),
    textTheme: TextTheme(
        titleLarge: GoogleFonts.pacifico(color: Colors.white, fontSize: 78),
        titleMedium: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: const Color(0xff7DD7DF),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        )),
  );
}
