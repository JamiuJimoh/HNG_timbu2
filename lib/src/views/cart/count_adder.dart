import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/services/cart_controller.dart';
import 'package:timbu/src/views/cart/adder.dart';

import '../../models/product.dart';
import '../../utils/app_colors.dart';

class CountAdder extends ConsumerWidget {
  const CountAdder({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Adder(
          icon: Icons.remove,
          onTap: ref.read(cartControllerProvider.notifier).boundaryReached(product)
              ? null
              : () {
                  ref.read(cartControllerProvider.notifier).decrement(product);
                },
        ),
        const SizedBox(width: 21.0),
        SizedBox(
          width: 10.0,
          child: Text(
            product.quantity.toString(),
            style: GoogleFonts.montserrat(
              fontSize: 12.0,
              color: kTabColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 21.0),
        Adder(
          icon: Icons.add,
          onTap: () {
            ref.read(cartControllerProvider.notifier).increment(product);
          },
        ),
      ],
    );
  }
}
