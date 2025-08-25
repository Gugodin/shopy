part of 'product_list_provider.dart';

abstract class ProductsListState {}

class ProductsListLoading extends ProductsListState {}

class ProductsListEmpty extends ProductsListState {
  final List<ProductEntity>? products;
  ProductsListEmpty({this.products});
}

class ProductsListLoaded extends ProductsListState {
  final List<ProductEntity> products;
  final List<ProductEntity> filteredProducts;

  ProductsListLoaded({required this.products, required this.filteredProducts});

  ProductsListLoaded.withoutFilter({required this.products})
      : filteredProducts = products;
}

class ProductsListError extends ProductsListState {
  final String message;
  final DataError error;
  ProductsListError({required this.message, required this.error});
}
