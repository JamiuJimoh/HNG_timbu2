import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/utils/app_colors.dart';
import 'package:timbu/src/views/widgets/custom_appbar.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: Stack(
        // fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 10,
            child: Image.asset('assets/confetti1.png'),
          ),
          Positioned(
            top: 0,
            child: Image.asset('assets/confetti2.png'),
          ),
          Positioned(
            left: 0,
            child: Image.asset('assets/confetti3.png'),
          ),
          Positioned(
            right: 0,
            child: Image.asset('assets/confetti4.png'),
          ),
          Positioned(
            top: 300,
            child: Image.asset('assets/confetti1.png'),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Payment Successful',
                style: GoogleFonts.montserrat(
                  fontSize: 22.0,
                  color: kTabColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/check.svg'),
                  const SizedBox(height: 13.0),
                  Text(
                    'Payment Successful',
                    style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      color: kTabColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 13.0),
                  Text(
                    'Thanks for your purchase',
                    style: GoogleFonts.montserrat(
                      fontSize: 14.0,
                      color: kTabColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
