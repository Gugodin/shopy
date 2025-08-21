import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:replacenamehere/app/app.dart';

import 'config/config.dart';

void main() {
  runApp(const ProviderManager());
}

// Este widget es el encargado de manejar el ProviderContainer
// y reiniciarlo cuando sea necesario, por ejemplo, al reiniciar la sesión o cuando la sesion expire.
class ProviderManager extends StatefulWidget {
  const ProviderManager({super.key});

  @override
  State<ProviderManager> createState() => _ProviderManagerState();
}

class _ProviderManagerState extends State<ProviderManager> {
  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: App(router: router),
    );
  }
}
