import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/services/cart_controller.dart';
import 'package:timbu/src/utils/app_router.dart';
import 'package:timbu/src/utils/constants.dart';
import 'package:timbu/src/views/cart/custom_cta.dart';
import 'package:timbu/src/views/widgets/custom_text_field.dart';

import '../../utils/app_colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/texfield_label.dart';
import 'custom_radio.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsInCart = ref.watch(cartControllerProvider).isNotEmpty;

    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      body: Padding(
        padding: commonPaddingHV,
        child: !itemsInCart
            ? Center(
                child: Text(
                  'No items to checkout',
                  style: GoogleFonts.montserrat(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: kTabColor,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select how to receive your package(s)',
                    style: GoogleFonts.montserrat(
                      color: kTabColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 21.0),
                  const TexFieldLabel(text: 'Pickup'),
                  const SizedBox(height: 8.0),
                  const CustomRadio(),
                  const SizedBox(height: 35.0),
                  const TexFieldLabel(text: 'Delivery'),
                  const SizedBox(height: 12.0),
                  const SizedBox(
                    height: 60.0,
                    child: CustomTextField(
                      borderOpacity: 0.5,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 35.0),
                  const TexFieldLabel(text: 'Contact'),
                  const SizedBox(height: 12.0),
                  LayoutBuilder(
                    builder: (_, constraints) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 39.0,
                            width: constraints.maxWidth * 0.7,
                            child: const CustomTextField(
                              hint: 'Phone nos 1',
                              borderOpacity: 0.4,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          SizedBox(
                            height: 39.0,
                            width: constraints.maxWidth * 0.7,
                            child: const CustomTextField(
                              hint: 'Phone nos 1',
                              borderOpacity: 0.4,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 62.0),
                  SizedBox(
                    height: 44.0,
                    child: CustomCTA(
                      text: 'Go to Payment',
                      onTap: () {
                        context.goNamed(AppRoute.payment.name);
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
