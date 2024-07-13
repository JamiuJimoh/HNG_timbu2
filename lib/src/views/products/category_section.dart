import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/utils/string_extensions.dart';
import 'package:timbu/src/views/products/product_item_tile.dart';
import 'package:timbu/src/views/widgets/current_item_indicator.dart';

import '../../models/product.dart';

class CategorySection extends StatefulWidget {
  const CategorySection(
      {super.key, required this.title, required this.products});
  final String title;
  final List<Product> products;

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  var _currentPage = 0;

  int get _page => (widget.products.length / 2).round();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title.toTitleCase(),
            style: GoogleFonts.montserrat(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 28.0),
          Expanded(
            child: PageView.builder(
              itemCount: _page,
              onPageChanged: (i) => setState(() => _currentPage = i),
              itemBuilder: (_, i) {
                // to show 2 products on individual PageView, they have to
                // be divided into pages => 6 products meaning 3 pages i.e
                // 6/2. Now, for the index of those pages, I came up with this
                // formular. i1 and i2 signifies the indices of 2 items of each page.
                // When i = 0; i1 = 0 and i2 = 1
                // When i = 1; i1 = 2 and i2 = 3
                // When i = 2; i1 = 4 and i2 = 5
                final i1 = i + (i + 0);
                final i2 = i + (i + 1);

                // checking for boundary incase so we don't access an item with
                // an index that don't exist
                final lastIndexReached = i2 >= widget.products.length;

                return Row(
                  children: [
                    Expanded(
                      child: ProductItemTile(product: widget.products[i1]),
                    ),
                    const SizedBox(width: 13.0),
                    Expanded(
                      child: lastIndexReached
                          ? const SizedBox()
                          : ProductItemTile(product: widget.products[i2]),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 27.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < _page; i++) ...[
                CurrentItemIndicator(isCurrentPage: _currentPage == i),
                const SizedBox(width: 13.0),
              ],
            ],
          )
        ],
      ),
    );
  }
}
