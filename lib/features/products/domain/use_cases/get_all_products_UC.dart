import 'package:shopy/core/core.dart';

import '../domain.dart';

class GetAllProductsUC extends UseCase<DataState<List<ProductEntity>>, void> {
  final ProductsRepository _productsRepository;

  GetAllProductsUC(this._productsRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({void params}) async {
    return _productsRepository.getAllProducts();
  }
}
