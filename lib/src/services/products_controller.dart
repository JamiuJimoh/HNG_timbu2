import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timbu/src/services/products_repo.dart';

import '../models/product.dart';

class ProductsList extends AutoDisposeAsyncNotifier<List<Product>> {
  // fetches the products and populates the implicit "state" variable
  // with the results.
  @override
  Future<List<Product>> build() async {
    const repo = ProductsRepo();
    return repo.fetchProducts();
  }

  // after the state gets populated with the list of products,
  // this method iterates through the list and sorts each products
  // to any categories that it exists in
  // This is what is being used by the UI 
  Map<String, List<Product>>? categories() {
    final products = state.value;
    if (products == null) return null;
    if (products.isEmpty) return null;

    final categoried = <String, List<Product>>{};
    for (final product in products) {
      for (final category in product.categories) {
        if ((categoried[category] ?? []).isEmpty) {
          categoried[category] = [];
        }
        categoried[category]!.add(product);
      }
    }
    return categoried;
  }
}

final productsListProvider =
    AsyncNotifierProvider.autoDispose<ProductsList, List<Product>>(
  ProductsList.new,
);
