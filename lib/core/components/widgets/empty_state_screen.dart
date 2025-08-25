import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy/config/assets/assets.dart';

class EmptyStateScreen extends StatelessWidget {
  final Function()? onRetry;
  final String entity;
  const EmptyStateScreen(
      {super.key, this.onRetry, required this.entity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Lottie.asset(AppAssets.lottieAssets.emptyAnimation,
            width: 300, height: 300, fit: BoxFit.fill),
        Text(
          '¡Nada por aquí!',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall,
        ),
        Text(
          'Parece que los $entity se fueron de vacaciones',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
        ElevatedButton(
          onPressed: onRetry,
          child: Text('Volver a cargar $entity'),
        ),
      ],
    );
  }
}
