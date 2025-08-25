import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/domain.dart';

class ProductDetailView extends StatefulWidget {
  final ProductDetailEntity product;
  const ProductDetailView({super.key, required this.product});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
    bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom + 15;
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Column(
          spacing: 10,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: statusBarHeight),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Skeleton.leaf(
                          child: Container(
                            width: 150,
                            height: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Skeletonizer.of(context).enabled
                                  ? theme.colorScheme.onSurface
                                      .withValues(alpha: 0.1)
                                  : Colors.transparent,
                            ),
                            child: Skeleton.ignore(
                              child: Hero(
                                  tag: 'product_image_${widget.product.id}',
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: CachedNetworkImage(
                                        imageUrl: widget.product.image),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Positioned(top: 10, left: 10, child: const BackButton()),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: theme.primaryColor,
                              )))
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      Text(
                        widget.product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      CategoryChip(label: widget.product.category.displayName),
                      Text(
                        '\$${widget.product.price}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        widget.product.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Expanded(
                          flex: 1,
                          child: CustomRatingStars(
                            value: widget.product.rating.rate,
                            starSize: 30,
                          )),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: CustomIconButton(
                                  icon: Icons.shopping_cart_checkout_rounded,
                                  onPressed: () {
                                    // Add to cart action
                                  })),
                          Expanded(
                            flex: 4,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add to cart action
                              },
                              child: const Text('Buy Now'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}