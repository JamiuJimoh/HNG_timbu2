import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/utils/app_colors.dart';

class CustomCTA extends StatelessWidget {
  const CustomCTA({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
          color: kTabColor,
        ),
      ),
    );
  }
}
