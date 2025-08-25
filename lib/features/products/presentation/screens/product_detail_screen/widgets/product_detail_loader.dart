import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../providers/providers.dart';
import 'product_detail_view.dart';

class ProductDetailLoader extends ConsumerStatefulWidget {
  final int id;
  const ProductDetailLoader({super.key, required this.id});

  @override
  ConsumerState<ProductDetailLoader> createState() =>
      _ProductDetailLoaderState();
}

class _ProductDetailLoaderState extends ConsumerState<ProductDetailLoader> {
  bool isManualLoading = false;
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
  Widget build(BuildContext context) {
    final productDetailState = ref.watch(productDetailProvider(widget.id));
    final bool isLoading = productDetailState.isLoading || isManualLoading;
    // final bool isLoading = productDetailState.isLoading || productDetailState.hasValue == false;
    return Skeletonizer(
      enabled: isLoading,
      child: productDetailState.when(
        skipLoadingOnRefresh: false,
        skipLoadingOnReload: false,
        data: (product) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && isManualLoading) {
              setState(() {
                isManualLoading = false;
              });
            }
          });
          return ProductDetailView(product: product);
        },
        loading: () => ProductDetailView(product: fakeProduct),
        error: (error, stack) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && isManualLoading) {
              setState(() {
                isManualLoading = false;
              });
            }
          });
          return ErrorStateScreen(
          messageErrorToUser: error.toString(),
          mainAxisAlignment: MainAxisAlignment.center,
          nameButton: 'Intentar de nuevo',
          needsBackButton: true,
          onRetry: () {
            setState(() {
              isManualLoading = true;
            });
            ref.invalidate(productDetailProvider(widget.id));
          },
        );
        },
      ),
    );
  }
}
