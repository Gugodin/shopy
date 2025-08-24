import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';
import 'products_list/card_product.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsListState = ref.watch(productListNotifierProvider) as ProductsListLoaded;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      separatorBuilder: (context, index) => const SizedBox(height: 25.0),
      itemCount: productsListState.products.length,
      itemBuilder: (context, index) {
        final product = productsListState.products[index];
        return CardProduct(product: product);
      },
    );
  }
}
