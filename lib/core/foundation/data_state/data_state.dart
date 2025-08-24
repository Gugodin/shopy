// ignore_for_file: public_member_api_docs, sort_constructors_first

// Clase que nos servirá de molde para poder tener retornos de valores con diferentes tipos
// Generalmente usado cuando se regresa un valor desde un servicio
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class DataState<T> {}

class DataSuccess<T> extends DataState<T> {
  final T data;
  DataSuccess(this.data);
}

class DataError<T> extends DataState<T> {
  final String? technicalMessage; // Para desarrolladores
  final String? userMessage; // Para usuarios

  DataError({this.technicalMessage, this.userMessage});
}

class DataDioError<T> extends DataError<T> {
  final DioException error;
  DataDioError(
      {required this.error, super.userMessage, super.technicalMessage});

  factory DataDioError.fromDioException(DioException e) {
    final statusCode = e.response?.statusCode;
    String userMessage;
    String technicalMessage;

    // Mensaje técnico detallado
    technicalMessage =
        'DioException: ${e.type} - Status: $statusCode - ${e.message}';

    // Mensaje amigable para el usuario
    switch (statusCode) {
      case 404:
        userMessage = 'No pudimos encontrar lo que buscas';
        break;
      case 500:
      case 502:
      case 503:
        userMessage =
            'El servidor está teniendo problemas. Inténtalo en unos minutos';
        break;
      case 408:
        userMessage = 'La conexión tardó demasiado. Revisa tu internet';
        break;
      default:
        if (e.type == DioExceptionType.connectionTimeout) {
          userMessage = 'Sin conexión a internet. Revisa tu conexión';
        } else {
          userMessage = 'Hay un problema con el servicio. Inténtalo más tarde';
        }
    }

    final errorDioGenerated = DataDioError<T>(
      error: DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: technicalMessage,
        message: technicalMessage,
      ),
      userMessage: userMessage,
      technicalMessage: technicalMessage,
    );

    debugPrint(errorDioGenerated.toString());
    return errorDioGenerated;
  }

  @override
  String toString() {
    return '''
    🔴 ERROR DE PETICIÓN 🖥
    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    📍 Mensaje:    ${error.message}
    📍 Tipo:       ${error.type}
    📍 Código:     ${error.response?.statusCode}
    📍 Detalles:   ${error.response?.data}
    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
''';
  }
}

class DataGeneralError<T> extends DataError<T> {
  String file;
  String line;
  String module;
  String stackTrace;

  DataGeneralError({
    required String userMessage,
    required String technicalMessage,
    required this.module,
    required this.stackTrace,
    required this.file,
    required this.line,
  }) : super(userMessage: userMessage, technicalMessage: technicalMessage);

  factory DataGeneralError.fromException(
      {required String message,
      required String module,
      required String file,
      required String line,
      required String stacktrace}) {
    return DataGeneralError<T>(
      userMessage:
          'Algo salió mal en la aplicación. Nuestro equipo fue notificado',
      technicalMessage: message,
      module: module,
      file: file,
      line: line,
      stackTrace: stacktrace,
    );
  }
}
