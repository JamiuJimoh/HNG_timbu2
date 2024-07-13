import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: kBGColor,
      appBarTheme: const AppBarTheme().copyWith(
        elevation: 0.0,
        color: kBGColor,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: GoogleFonts.montserrat(
          color: kTabColor,
          fontWeight: FontWeight.w600,
          fontSize: 19.0,
        ),
      ),
      radioTheme: RadioThemeData(
        visualDensity: VisualDensity.comfortable,
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return kTabColor.withOpacity(0.5);
          }
          if (states.contains(WidgetState.selected)) {
            return kPrimaryColor;
          }
          return kTabColor.withOpacity(0.5);
        }),
      ),
    );
  }
}
