import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu/src/utils/app_colors.dart';
import 'package:timbu/src/utils/constants.dart';
import 'package:timbu/src/views/error_text.dart';
import 'package:timbu/src/views/products/category_section.dart';
import 'package:timbu/src/views/widgets/custom_appbar.dart';

import '../../services/products_controller.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProducts = ref.watch(productsListProvider);

    return Scaffold(
      appBar: CustomAppBar(title: 'Product List'),
      body: Padding(
        padding: commonPaddingHV,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 44.0),
              asyncProducts.when(
                loading: () => const CircularProgressIndicator.adaptive(),
                error: (e, _) => ErrorText(error: e),
                data: (_) {
                  final categories =
                      ref.watch(productsListProvider.notifier).categories() ??
                          {};
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categories.keys.length,
                      itemBuilder: (_, i) {
                      // Products gotten from the api are further categorised in the
                      // app. The UI consumes a Map of category name as key and a list of 
                      // products with that categories as value. Check out the 
                      // ProductsController where the magic happens
                        final key = categories.keys.toList()[i];
                        final value = categories[key] ?? [];
                        return Column(
                          children: [
                            CategorySection(title: key, products: value),
                            if (i < categories.keys.length - 1)
                              const SizedBox(height: 67.0),
                          ],
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
