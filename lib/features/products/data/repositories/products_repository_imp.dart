import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final productsAPI = ProductsDataSource(Dio());
  @override
  Future<DataState<List<ProductEntity>>> getAllProducts() async {
    try {
      final response = await productsAPI.getAllProducts();
      return DataSuccess(response.data);
    } on DioException catch (e) {
      return DataError.fromDioException(e);
    }
  }

  @override
  Future<DataState<ProductDetailEntity>> getProductById(int id) async {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  // @override
  // Future<DataState<UserEntity>> login(String email, String password) async {
  //   try {
  //     // final response = await authAPI.login(email, password);

  //     // final apiResponse = response.data;

  //     return DataSuccess(UserModel.fromJson({}));
  //   } on DioException catch (e) {
  //     // Se llama al factory de DataError para crear el error
  //     // a partir de la excepción de Dio
  //     return DataError.fromDioException(e);
  //   }
  // }
}
