import 'package:replacenamehere/core/core.dart';

import '../entities/entities.dart';

abstract class ProductsRepository {
  Future<DataState<List<ProductEntity>>> getAllProducts();
  Future<DataState<ProductDetailEntity>> getProductById(int id);
}
