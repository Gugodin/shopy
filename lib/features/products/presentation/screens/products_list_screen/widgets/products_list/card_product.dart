import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:shopy/config/config.dart';
import 'package:shopy/core/components/components.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../domain/domain.dart';

class CardProduct extends StatelessWidget {
  final ProductEntity product;
  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Bounceable(
      onTap: () => context.pushRoute(
        ProductDetailRoute(
          // Comportamiento normal dentro de la app
          product: ProductDetailEntity.fromProductEntity(product),
          //TODO: Simulando deep linking
          // id: product.id,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        height: size.height * 0.18,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: AppShadowStyle.containerShadow,
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Skeletonizer.of(context).enabled
                          ? theme.colorScheme.onSurface.withValues(alpha: 0.1)
                          : Colors.transparent,
                    ),
                    child: Skeleton.replace(
                      child: Hero(
                          tag: 'product_image_${product.id}',
                          child: CachedNetworkImage(imageUrl: product.image)),
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleLarge!
                                .copyWith(color: theme.colorScheme.onSurface),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryChip(category: product.category),
                            Text(
                              '\$${product.price}',
                              style: theme.textTheme.titleMedium,
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child:
                                CustomRatingStars(value: product.rating.rate))),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
