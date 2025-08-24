import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../config/config.dart';
import '../../../providers/providers.dart';

class ErrorProductsListScreen extends StatelessWidget {
  final ProductsListError error;
  final String nameButton;
  final Function()? onRetry;

  const ErrorProductsListScreen({super.key, required this.error, this.onRetry, required this.nameButton});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Lottie.asset(AppAssets.lottieAssets.serverErrorAnimation,
            width: 300, height: 300, fit: BoxFit.fill),
        Text(
          'Upss, parece que algo salió mal',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall,
        ),
        Text(
          error.message,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
        ElevatedButton(
          onPressed: onRetry,
          child: Text(nameButton),
        ),
      ],
    );
  }
}
