import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core.dart';

class CategoryChip extends StatelessWidget {
  final Category category;
  final Function(Category categorySelected)? onTap;
  final bool isSelected;
  final double fontSize;
  const CategoryChip(
      {super.key, required this.category, this.onTap, this.isSelected = false, this.fontSize = 10});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Bounceable(
      onTap: () => onTap?.call(category),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: onTap == null || isSelected
              ? theme.colorScheme.primary
              : Colors.grey,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Skeleton.ignore(
              child: Text(
                category.displayName,
                style:  TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize,
                ),
              ),
            ),
            if (onTap != null && isSelected)
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Icon(
                  Icons.close,
                  size: 12,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
