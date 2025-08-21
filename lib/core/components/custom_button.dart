import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../config/config.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final bool loading;
  final EdgeInsets? padding;
  final EdgeInsets? marging;
  final bool expands;
  const CustomButton(
      {super.key,
      this.onTap,
      required this.title,
      this.loading = false,
      this.padding,
      this.expands = false,
      this.marging});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: marging ?? EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Bounceable(
          onTap: onTap,
          child: Container(
            width: expands ? double.infinity : null,
            padding: padding ??
                const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: AppShadowStyle.btnShadow),
            child: Center(
              child: loading
                  ? SizedBox(
                      width: (padding?.vertical ?? 40) / 2,
                      height: (padding?.vertical ?? 40) / 2,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
            ),
          )),
    );
  }
}
