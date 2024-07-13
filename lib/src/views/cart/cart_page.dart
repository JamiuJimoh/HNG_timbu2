import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/services/cart_controller.dart';
import 'package:timbu/src/utils/app_colors.dart';
import 'package:timbu/src/utils/constants.dart';
import 'package:timbu/src/views/cart/cart_item_tile.dart';
import 'package:timbu/src/views/cart/shopping_summary.dart';

import '../widgets/custom_appbar.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartControllerProvider);

    return Scaffold(
      appBar: CustomAppBar(title: 'My Cart'),
      body: Padding(
        padding: commonPaddingHV,
        child: cart.isEmpty
            ? Center(
                child: Text(
                  'No Item in Cart',
                  style: GoogleFonts.montserrat(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: kTabColor,
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cart.length,
                      itemBuilder: (_, i) {
                        return Column(
                          children: [
                            CartItemTile(product: cart[i]),
                            if (i < cart.length - 1)
                              const SizedBox(height: 21.0),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 31.0),
                    const ShoppingSummary(),
                  ],
                ),
              ),
      ),
    );
  }
}
