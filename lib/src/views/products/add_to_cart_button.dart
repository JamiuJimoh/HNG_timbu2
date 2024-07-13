import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/utils/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton(
      {super.key, required this.onTap, required this.isActive});
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : null,
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Text(
          'Add${isActive ? ' more' : ''} to Cart',
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: kTabColor,
          ),
        ),
      ),
    );
  }
}
