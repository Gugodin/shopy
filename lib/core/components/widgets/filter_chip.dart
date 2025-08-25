import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:shopy/core/core.dart';

class FilterChipWidget extends StatelessWidget {
  final Function(TypeFilter selected)? onTap;
  final TypeFilter typeFilter;

  const FilterChipWidget({super.key, required this.onTap, required this.typeFilter});

  IconData _iconForTypeFilter(TypeFilter typeFilter) {

    if(typeFilter is CategoryFilter) {
      return Icons.category;
    } else if (typeFilter is PriceFilter) {
      return Icons.price_change;
    } else if (typeFilter is RatingFilter) {
      return Icons.star_rate;
    } else {
      return Icons.filter_list;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Bounceable(
      onTap: () => onTap?.call(typeFilter),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
          color:  theme.colorScheme.primary
              ,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          children: [
            Icon(_iconForTypeFilter(typeFilter), color: Colors.white, size: 16),
            
              Text(
                typeFilter.name,
                style:  TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            
            
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