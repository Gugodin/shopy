

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/core.dart';

// part 'auth_data_source.g.dart';

// Si en algun momento al generar el codigo se genera un error, en relación a ParseErrorLogger
// asegurate que el paquete que estas importanto es package:retrofit/retrofit.dart

@RestApi(baseUrl: BASE_URL)
abstract class AuthDataSource {

  // factory AuthDataSource(Dio dio) = _AuthDataSource;

  @POST('/login')
  //Utilizamos como return el HttpResponse, para poder obtener el status code
  Future<HttpResponse<dynamic>> login(
    @Field('username') String email,
    @Field('password') String password,
  );
}