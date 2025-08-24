import 'package:flutter/material.dart';

import '../../../providers/providers.dart';

class ErrorProductsListScreen extends StatelessWidget {
  final ProductsListError error;
  final Function()? onRetry;

  const ErrorProductsListScreen({super.key, required this.error, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Upss, parece que algo salió mal.'),
        Text(error.message),
        ElevatedButton(
          onPressed: onRetry,
          child: Text('Retry'),
        ),
      ],
    );
  }
}
