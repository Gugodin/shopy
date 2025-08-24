
part of 'product_list_provider.dart';

abstract class ProductsListState {}

class ProductsListInitial extends ProductsListState {}
class ProductsListLoading extends ProductsListState {}
class ProductsListEmpty extends ProductsListState {}
class ProductsListLoaded extends ProductsListState {
  final List<ProductEntity> products;

  ProductsListLoaded(this.products);
}
class ProductsListError extends ProductsListState {
  final String message;
  final DataError error;
  ProductsListError({required this.message, required this.error});
}