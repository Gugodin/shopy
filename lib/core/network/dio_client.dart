// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../core.dart';

// Singletion que sirve para crear una instancia de Dio
// y agregarle un interceptor de autenticación.
class DioClient {
  static DioClient? _instance;
  late final Dio dio;

  factory DioClient({bool showLogs = false}) {
    _instance ??= DioClient._internal(showLogs: showLogs);
    return _instance!;
  }

  DioClient._internal({bool showLogs = false}) {
    dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));
    // Agrega un interceptor de logging para depuración
    // Imprime en consola las solicitudes y respuestas
    if (showLogs) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          logPrint: (obj) => print(obj),
        ),
      );
    }
  }
}
