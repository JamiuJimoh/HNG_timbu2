import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:timbu/src/services/cart_controller.dart';
import 'package:timbu/src/utils/constants.dart';
import 'package:timbu/src/views/cart/custom_cta.dart';
import 'package:timbu/src/views/widgets/custom_text_field.dart';
import 'package:timbu/src/views/widgets/texfield_label.dart';

import '../../utils/app_router.dart';


class PaymentPage extends ConsumerWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: false,
        leading: GestureDetector(
          onTap: context.pop,
          child: const Icon(Icons.arrow_back, size: 30.0),
        ),
      ),
      body: Padding(
        padding: commonPaddingH,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/card.svg'),
            const SizedBox(height: 34.0),
            const TexFieldLabel(text: 'Card Number'),
            const SizedBox(height: 12.0),
            const SizedBox(
              height: 47.0,
              child: CustomTextField(
                borderOpacity: 0.4,
                hintSize: 14.0,
                hint: '0000 0000 0000 0000',
              ),
            ),
            const SizedBox(height: 24.0),
            const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TexFieldLabel(text: 'Expiry Date'),
                      SizedBox(height: 12.0),
                      SizedBox(
                        height: 47.0,
                        child: CustomTextField(
                          borderOpacity: 0.4,
                          hintSize: 14.0,
                          hint: 'MM/YY',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 22.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TexFieldLabel(text: 'CVV'),
                      SizedBox(height: 12.0),
                      SizedBox(
                        height: 47.0,
                        child: CustomTextField(
                          borderOpacity: 0.4,
                          hintSize: 14.0,
                          hint: '123',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 63.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SizedBox(
                height: 44.0,
                child: CustomCTA(
                  text: 'Make Payment',
                  onTap: () {
                    ref.read(cartControllerProvider.notifier).clear();
                    context.goNamed(AppRoute.paymentSuccess.name);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
