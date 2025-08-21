import 'package:flutter/material.dart';

import '../config/config.dart';

class App extends StatelessWidget {
  final AppRouter router;
  const App({super.key, required this.router});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: router.config(),
    );
  }
}
