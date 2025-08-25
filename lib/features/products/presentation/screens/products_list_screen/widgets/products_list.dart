import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../providers/providers.dart';
import 'products_list/card_product.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsListState = ref.watch(productListNotifierProvider);

    final bool isLoading = productsListState is ProductsListLoading;
    final List<ProductEntity> products = isLoading
        ? List.generate(4, (index) => _createDummyProduct(index))
        : (productsListState as ProductsListLoaded).products;

    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        separatorBuilder: (context, index) => const SizedBox(height: 25.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CardProduct(product: products[index]);
        },
      ),
    );
  }

  ProductEntity _createDummyProduct(int index) {
    return ProductEntity(
      id: index,
      title: BoneMock.paragraph,
      price: 100.00,
      description: 'Loading description for the product',
      category: Category.jewelery, // O cualquier categoría por defecto
      image: 'https://via.placeholder.com/150',
      rating: Rating(rate: 4.5, count: 100),
    );
  }
}
