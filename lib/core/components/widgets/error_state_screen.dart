import 'package:flutter/material.dart' hide BackButton;
import 'package:lottie/lottie.dart';

import '../../../config/config.dart';
import '../../core.dart';

class ErrorStateScreen extends StatelessWidget {
  final String messageErrorToUser;
  final String nameButton;
  final MainAxisAlignment mainAxisAlignment;
  final Function()? onRetry;
  final bool needsBackButton;

  const ErrorStateScreen(
      {super.key,
      required this.messageErrorToUser,
      this.onRetry,
      required this.nameButton,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.needsBackButton = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
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
                messageErrorToUser,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              ElevatedButton(
                onPressed: onRetry,
                child: Text(nameButton),
              ),
            ],
          ),
        ),
        if (needsBackButton)
          Positioned(
            top: 50,
            left: 15,
            child: const BackButton(),
          ),
      ],
    );
  }
}
