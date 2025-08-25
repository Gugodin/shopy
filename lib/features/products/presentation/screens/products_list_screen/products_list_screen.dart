import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/core.dart';
import '../../providers/providers.dart';
import 'widgets/widgets.dart';

@RoutePage()
class ProductsListScreen extends ConsumerStatefulWidget {
  const ProductsListScreen({super.key});

  @override
  ConsumerState<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends ConsumerState<ProductsListScreen> {
  bool isThereCategorySelected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // appBar: AppBar(title: const Text('Login')),
        body: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              SizedBox(
                height: size.height * 0.2,
                child: HeaderProductsList(),
              ),
              SizedBox(
                child: FilterProductsList(
                  onCategorySelected: (isDisplayedCategoryChip) => setState(() {
                    isThereCategorySelected = isDisplayedCategoryChip;
                  }),
                ),
              ),
              SizedBox(
                height: isThereCategorySelected
                    ? size.height * 0.6
                    : size.height * 0.65,
                child: _buildProductsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductsList() {
    final productsListState = ref.watch(productListNotifierProvider);

    switch (productsListState) {
      case ProductsListLoaded() || ProductsListLoading():
        return ProductsList();
      case ProductsListEmpty():
        return EmptyStateScreen(
          entity: 'productos',
          onRetry: () {
            ref.read(productListNotifierProvider.notifier).fetchProducts();
          },
        );
      case ProductsListError():
        return ErrorStateScreen(
          messageErrorToUser: productsListState.message,
          nameButton: 'Intentar de nuevo',
          onRetry: () {
            ref.read(productListNotifierProvider.notifier).fetchProducts();
          },
        );
      default:
        return const SizedBox();
    }
  }
}
