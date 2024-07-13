import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/services/cart_controller.dart';
import 'package:timbu/src/utils/app_colors.dart';
import 'package:timbu/src/views/cart/count_adder.dart';
import 'package:timbu/src/views/widgets/network_image.dart';

import '../../models/product.dart';

const imageWidth = 70.0;
const verticalSpace = 28.0;

class CartItemTile extends ConsumerWidget {
  const CartItemTile({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // height: 138,
      padding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: verticalSpace),
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: const Color.fromRGBO(42, 42, 42, 0.1)),
      ),
      child: LayoutBuilder(
        builder: (_, constraints) {
          // final discWidth = (constraints.maxWidth * 0.7) - imageWidth;
          final discWidth = (constraints.maxWidth) - imageWidth - verticalSpace;

          return Row(
            // SizedBox(),
            children: [
              SizedBox(
                height: imageWidth,
                width: imageWidth,
                child: CustomNetworkImage(url: product.photo),
              ),
              const SizedBox(width: 23.0),
              Row(
                children: [
                  SizedBox(
                    width: discWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: discWidth * 0.7,
                              child: Text(
                                product.name,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0,
                                  color: kTabColor,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(cartControllerProvider.notifier)
                                    .remove(product.id);
                              },
                              child: SvgPicture.asset('assets/bin.svg'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        SizedBox(
                          width: discWidth * 0.7,
                          child: Text(
                            product.description,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.0,
                              color: kTabColor,
                            ),
                            // maxLines: 2,
                          ),
                        ),
                        const SizedBox(height: 13.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CountAdder(product: product),
                            Text(
                              product.sanitizedPrice,
                              style: GoogleFonts.montserrat(
                                fontSize: 14.0,
                                color: kTabColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: priceWidth,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       GestureDetector(
                  //         child: SvgPicture.asset('assets/bin.svg'),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
