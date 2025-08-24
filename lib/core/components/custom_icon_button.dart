import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:shopy/config/config.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Bounceable(
      onTap: onPressed,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: AppShadowStyle.containerShadow,
          ),
          child: Icon(
            icon,
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
