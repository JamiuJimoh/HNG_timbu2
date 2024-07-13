import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/services/cart_controller.dart';
import 'package:timbu/src/utils/app_colors.dart';
import 'package:timbu/src/utils/app_router.dart';
import 'package:timbu/src/views/cart/jagged_line_painter.dart';
import 'package:timbu/src/views/cart/summary_text_tile.dart';
import 'package:timbu/src/views/widgets/custom_cta.dart';
import 'package:timbu/src/views/widgets/custom_text_field.dart';

class ShoppingSummary extends ConsumerWidget {
  const ShoppingSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(cartControllerProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 17.0),
      decoration: BoxDecoration(
        color: kSurfaceColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shopping Summary',
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: kTabColor,
            ),
          ),
          const SizedBox(height: 25.0),
          Text(
            'Discount Code',
            style: GoogleFonts.montserrat(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: kTabColor.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 41.0,
            child: Row(
              children: [
                const Expanded(
                  child: CustomTextField(borderOpacity: 0.7),
                ),
                const SizedBox(width: 36.0),
                SizedBox(
                  height: 41.0,
                  child: CustomCTA(
                    text: 'Apply',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25.0),
          SummaryTextTile(
            leftText: 'Sub-Total',
            rightText: ref.watch(cartControllerProvider.notifier).subtotalCost,
          ),
          const SizedBox(height: 18.0),
          SummaryTextTile(
            leftText: 'Delivery Fee',
            rightText:
                ref.watch(cartControllerProvider.notifier).deliveryFeeString,
          ),
          const SizedBox(height: 18.0),
          SummaryTextTile(
            leftText: 'Discount Amount',
            rightText:
                ref.watch(cartControllerProvider.notifier).discountAmountString,
          ),
          const SizedBox(height: 25.0),
          CustomPaint(
            size: const Size(double.infinity, 2.0),
            painter: JaggedLinePainter(),
          ),
          const SizedBox(height: 23.0),
          SummaryTextTile(
            leftText: 'Total Amount',
            rightText: ref.watch(cartControllerProvider.notifier).totalAmount,
          ),
          const SizedBox(height: 35.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 44.0,
            width: double.infinity,
            child: CustomCTA(
              text: 'Checkout',
              onTap: () => context.goNamed(AppRoute.checkout.name),
            ),
          ),
        ],
      ),
    );
  }
}
