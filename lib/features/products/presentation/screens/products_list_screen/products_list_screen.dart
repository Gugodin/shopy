import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopy/features/products/presentation/screens/products_list_screen/states_screens/error_products_list_screen.dart';

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

    switch (productsListState){
      case ProductsListInitial():
        return const Center(child: CircularProgressIndicator());
      case ProductsListLoading():
        return const Center(child: CircularProgressIndicator());
      case ProductsListLoaded():
        return ProductsList();
      case ProductsListEmpty():
        return const Center(child: Text('No hay productos disponibles.'));
      case ProductsListError():
        return ErrorProductsListScreen(error: productsListState);
      default:
        return const Center(child: Text('Estado desconocido.'));
    }
  }

}
