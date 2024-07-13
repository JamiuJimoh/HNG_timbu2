import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({super.key});

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  var _pickup = Pickup.one;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<Pickup>(
          value: Pickup.one,
          dense: false,
          contentPadding: EdgeInsets.zero,
          groupValue: _pickup,
          onChanged: (pickup) {
            if (pickup == null) return;
            setState(() {
              _pickup = pickup;
            });
          },
          title: Text(
            'Old Secretariat Complex, Area 1, Garki Abaji Abji',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              color: kTabColor.withOpacity(0.67),
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        RadioListTile<Pickup>(
          value: Pickup.two,
          contentPadding: EdgeInsets.zero,
          dense: true,
          groupValue: _pickup,
          onChanged: (pickup) {
            if (pickup == null) return;
            setState(() {
              _pickup = pickup;
            });
          },
          title: Text(
            'Sokoto Street, Area 1, Garki Area 1 AMAC',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              color: kTabColor.withOpacity(0.67),
            ),
          ),
        ),
      ],
    );
  }
}

enum Pickup { one, two }
