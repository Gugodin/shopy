import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';


class ProductsRepositoryImp implements ProductsRepository {
  final productsAPI = ProductsDataSource(DioClient(showLogs:true).dio);
  @override
  Future<DataState<List<ProductEntity>>> getAllProducts() async {
    try {
      final response = await productsAPI.getAllProducts();
      return DataSuccess(response.data);
    } on DioException catch (e) {
      return DataDioError.fromDioException(e);
    } catch (e, stackTrace) {
      return DataGeneralError.fromException(
        message: e.toString(),
        module: 'ProductsRepository',
        file: 'products_repository_imp.dart',
        line: 'getAllProducts()',
        stacktrace: stackTrace.toString(),
      );
    }
  }

  @override
  Future<DataState<ProductDetailEntity>> getProductById(int id) async {
    try {
      final response = await productsAPI.getProductById(id.toString());
      return DataSuccess(response.data);
    } on DioException catch (e) {
      return DataDioError.fromDioException(e);
    } catch (e, stackTrace) {
      return DataGeneralError.fromException(
        message: e.toString(),
        module: 'ProductsRepository',
        file: 'products_repository_imp.dart',
        line: 'getProductById()',
        stacktrace: stackTrace.toString(),
      );
    }
  }
}
