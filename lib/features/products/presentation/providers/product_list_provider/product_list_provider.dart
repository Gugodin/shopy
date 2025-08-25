import 'package:riverpod/riverpod.dart';

import '../../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../repository_provider/repository_provider.dart';

part 'states.dart';

final getAllProductsUCProvider = Provider<GetAllProductsUC>((ref) {
  return GetAllProductsUC(ref.watch(repositoryProvider));
});

final productListNotifierProvider =
    StateNotifierProvider<ProductListNotifier, ProductsListState>((ref) {
  return ProductListNotifier(ref.watch(getAllProductsUCProvider));
});

class ProductListNotifier extends StateNotifier<ProductsListState> {
  final GetAllProductsUC _getAllProductsUC;

  ProductListNotifier(this._getAllProductsUC) : super(ProductsListLoading()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    state = ProductsListLoading();

    final result = await _getAllProductsUC.call();

    if (result is DataSuccess<List<ProductEntity>>) {
      if (result.data.isEmpty) {
        state = ProductsListEmpty();
        return;
      } else {
        state = ProductsListLoaded.withoutFilter(products: result.data);
      }
    } else if (result is DataDioError<List<ProductEntity>>) {
      state = ProductsListError(message: result.userMessage!, error: result);
    } else if (result is DataGeneralError<List<ProductEntity>>) {
      state = ProductsListError(message: result.userMessage!, error: result);
    }
  }

  Future<void> filterProductsByName(String nameProduct) async {
    if (state is ProductsListLoaded) {
      final currentState = state as ProductsListLoaded;

      final filtered = currentState.products.where((product) {
        return product.title.toLowerCase().contains(nameProduct.toLowerCase());
      }).toList();

      if (filtered.isEmpty) {
        state = ProductsListEmpty(products: currentState.products);
      } else {
        state = ProductsListLoaded(
            filteredProducts: filtered, products: currentState.products);
      }
    }

    if (state is ProductsListEmpty) {
      final currentState = state as ProductsListEmpty;
      final filtered = currentState.products!.where((product) {
        return product.title.toLowerCase().contains(nameProduct.toLowerCase());
      }).toList();

      if (filtered.isEmpty) {
        state = ProductsListEmpty(products: currentState.products);
      } else {
        state = ProductsListLoaded(
            filteredProducts: filtered, products: currentState.products!);
      }
    }
  }

  Future<void> clearFilters() async {
    if (state is ProductsListLoaded) {
      final currentState = state as ProductsListLoaded;
      state = ProductsListLoaded.withoutFilter(products: currentState.products);
    }
    if(state is ProductsListEmpty) {
      final currentState = state as ProductsListEmpty;
      state = ProductsListLoaded.withoutFilter(products: currentState.products!);
    }
  }
}
