import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/utils/app_colors.dart';

class SummaryTextTile extends StatelessWidget {
  const SummaryTextTile(
      {super.key, required this.leftText, required this.rightText});
  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: kTabColor.withOpacity(0.8),
          ),
        ),
        Text(
          rightText,
          style: GoogleFonts.montserrat(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: kTabColor.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

