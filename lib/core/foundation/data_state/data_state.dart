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
  final String? message;
  DataError({this.message});
}

class DataDioError<T> extends DataError<T> {
  final DioException error;
  DataDioError(this.error) : super(message: null);

  factory DataDioError.fromDioException(DioException e) {
    final statusCode = e.response?.statusCode;
    String? message;

    final data = e.response?.data;
    if (data is Map && data['message'] != null) {
      message = data['message'] as String;
    }

    if (statusCode == 500) {
      message ??= "Error interno del servidor.";
    } else if (statusCode == null) {
      message ??=
          "Hubo problemas al conectar con el servidor. Inténtelo más tarde.";
    } else {
      message ??=
          "Error al intentar iniciar sesión, inténtelo de nuevo más tarde.";
    }
    final errorDioGenerated = DataDioError<T>(
      DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: message,
        message: message,
      ),
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
    required super.message,
    required this.module,
    required this.stackTrace,
    required this.file,
    required this.line,
  });

  factory DataGeneralError.fromException(
      {required String message,
      required String module,
      required String file,
      required String line,
      required String stacktrace}) {
    final error = DataGeneralError<T>(
      message: message,
      module: module,
      file: file,
      line: line,
      stackTrace: stacktrace,
    );

    debugPrint(
      error.toString(),
    );

    return error;
  }

  @override
  String toString() {
    return '''
    🔴 ERROR GENERAL 💻
    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    📍 Módulo:     $module
    📍 Archivo:    $file
    📍 Línea:      $line
    📍 Mensaje:    $message

    📋 STACK TRACE:
    $stackTrace
    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
''';
  }
}
