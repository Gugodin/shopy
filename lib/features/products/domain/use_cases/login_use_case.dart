
import 'package:replacenamehere/core/core.dart';

import '../domain.dart';

class LoginUseCase extends UseCase<DataState<List<ProductEntity>>, void> {

  final ProductsRepository _productsRepository;
  
  LoginUseCase(this._productsRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({void params}) async {

    return _productsRepository.getAllProducts();
  }
}


