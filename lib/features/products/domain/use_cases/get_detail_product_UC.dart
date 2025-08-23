

import '../../../../core/core.dart';
import '../domain.dart';

class GetDetailProductUC extends UseCase<DataState<ProductDetailEntity>, int> {

  final ProductsRepository productsRepository;

  GetDetailProductUC(this.productsRepository);

  @override
  Future<DataState<ProductDetailEntity>> call({int? params}) {
    if (params == null) {
      throw Exception('Product ID cannot be null');
    }
    return productsRepository.getProductById(params);
  }

}