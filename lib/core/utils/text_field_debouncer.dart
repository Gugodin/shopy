import 'package:flutter/material.dart';
import '../core.dart';

class TextFieldDebouncer {
  final Debouncer _debouncer;
  final List<TextEditingController> _controllers = [];
  final void Function() onChanged;

  TextFieldDebouncer({
    required this.onChanged,
    Duration delay = const Duration(milliseconds: 500),
  }) : _debouncer = Debouncer(delay: delay);

  /// Registra un TextEditingController para escuchar cambios
  void registerController(TextEditingController controller) {
    _controllers.add(controller);
    controller.addListener(_onTextChanged);
  }

  /// Registra múltiples controllers a la vez
  void registerControllers(List<TextEditingController> controllers) {
    for (final controller in controllers) {
      registerController(controller);
    }
  }

  void _onTextChanged() {
    _debouncer.call(onChanged);
  }

  /// Libera recursos
  void dispose() {
    _debouncer.dispose();
    for (final controller in _controllers) {
      controller.removeListener(_onTextChanged);
    }
    _controllers.clear();
  }
}