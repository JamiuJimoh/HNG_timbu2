import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/services/cart_controller.dart';
import 'package:timbu/src/utils/app_colors.dart';
import 'package:timbu/src/views/products/add_to_cart_button.dart';
import 'package:timbu/src/views/widgets/network_image.dart';

import '../../models/product.dart';

class ProductItemTile extends ConsumerWidget {
  const ProductItemTile({super.key, required this.product});
  final Product product;

  int get ratings => product.ratings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(cartControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 184.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: kSurfaceColor,
          ),
          child: CustomNetworkImage(url: product.photo),
        ),
        const SizedBox(height: 16.0),
        Text(
          product.name,
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: kTabColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.visible,
          // overflow: TextOverflow.visible,
        ),
        const SizedBox(height: 16.0),
        Text(
          product.description,
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: kTabColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            for (var i = 0; i < ratings; i++)
              SvgPicture.asset('assets/star_filled.svg'),
            for (var i = 0; i < 5 - ratings; i++)
              SvgPicture.asset('assets/star_unfilled.svg')
          ],
        ),
        const SizedBox(height: 13.0),
        Text(
          product.sanitizedPrice,
          style: GoogleFonts.montserrat(
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor),
          maxLines: 1,
          overflow: TextOverflow.visible,
        ),
        const SizedBox(height: 13.0),
        AddToCartButton(
          isActive: ref.read(cartControllerProvider.notifier).inCart(product),
          onTap: () {
            ref.read(cartControllerProvider.notifier).add(product);
          },
        ),
      ],
    );
  }
}
