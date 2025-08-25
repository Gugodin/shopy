import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomRatingStars extends StatelessWidget {
  final double value;
  final int starCount;
  final double starSize;

  const CustomRatingStars({
    super.key,
    required this.value,
    this.starCount = 5,
    this.starSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: value >= 4
                  ? Colors.green
                  : (value >= 2 ? Colors.amber : Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Skeleton.ignore(
              child: Text(
                '${value.toStringAsFixed(1)} / $starCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        RatingStars(
          value: value,
          starCount: starCount,
          starSize: starSize,
          valueLabelVisibility: false,
        ),
      ],
    );
  }
}


// RatingStars(
//                               value: product.rating.rate,
//                               starCount: 5,
//                               starSize: 20,
//                               valueLabelColor: product.rating.rate >= 4
//                                   ? Colors.green
//                                   : (product.rating.rate >= 2
//                                       ? Colors.amber
//                                       : Colors.red),
//                             ),