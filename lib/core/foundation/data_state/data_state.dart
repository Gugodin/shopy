// ignore_for_file: public_member_api_docs, sort_constructors_first

// Clase que nos servirá de molde para poder tener retornos de valores con diferentes tipos
// Generalmente usado cuando se regresa un valor desde un servicio
import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  DataState({
    this.data,
    this.error,
  });
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  DataError(DioException error) : super(error: error);

  
    factory DataError.fromDioException(DioException e) {
    final statusCode = e.response?.statusCode;
    String? message;

    final data = e.response?.data;
    if (data is Map && data['message'] != null) {
      message = data['message'] as String;
    }

    if (statusCode == 500) {
      message ??= "Error interno del servidor.";
    } else if (statusCode == null) {
      message ??= "Hubo problemas al conectar con el servidor. Inténtelo más tarde.";
    } else {
      message ??= "Error al intentar iniciar sesión, inténtelo de nuevo más tarde.";
    }

    return DataError(
      DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: message,
        message: message,
      ),
    );
  }
}
