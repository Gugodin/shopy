import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class AuthRepositoryImp implements AuthRepository {
  // final authAPI = AuthDataSource(Dio());

  @override
  Future<DataState<UserEntity>> login(String email, String password) async {
    try {
      // final response = await authAPI.login(email, password);

      // final apiResponse = response.data;
      

      return DataSuccess(UserModel.fromJson({}));
    } on DioException catch (e) {
      // Se llama al factory de DataError para crear el error
      // a partir de la excepción de Dio
      return DataError.fromDioException(e);
    }
  }
}
