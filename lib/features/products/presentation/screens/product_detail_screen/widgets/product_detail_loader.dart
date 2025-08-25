import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../providers/providers.dart';
import 'product_detail_view.dart';

class ProductDetailLoader extends ConsumerWidget {
  final int id;
  ProductDetailLoader({super.key, required this.id});

  final fakeProduct = ProductDetailEntity(
    id: -1,
    title: BoneMock.paragraph,
    price: 100.00,
    description: BoneMock.longParagraph,
    category: Category.jewelery, // O cualquier categoría por defecto
    image: 'https://via.placeholder.com/150',
    rating: Rating(rate: 4.5, count: 100),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetailState = ref.watch(productDetailProvider(id));
    return Skeletonizer(
      enabled: productDetailState is AsyncLoading,
      child: ref.watch(productDetailProvider(id)).when(
            data: (product) => ProductDetailView(product: product),
            loading: () => ProductDetailView(product: fakeProduct),
            error: (error, stack) => ErrorStateScreen(
              messageErrorToUser: error.toString(),
              mainAxisAlignment: MainAxisAlignment.center,
              nameButton: 'Intentar de nuevo',
              needsBackButton: true,
              onRetry: () {
                ref.invalidate(productDetailProvider(id));
              },
            ),
          ),
    );
  }
}
