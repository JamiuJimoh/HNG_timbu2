import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class TexFieldLabel extends StatelessWidget {
  const TexFieldLabel({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: kTabColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
