import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  ThemeConfig._();

  static ThemeData getThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFD0BCFF),
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }
}
