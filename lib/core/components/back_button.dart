import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
          onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
    );
  }
}
