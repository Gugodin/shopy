import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopy/features/products/domain/domain.dart';

import '../../../../../core/core.dart';
import '../../providers/providers.dart';

@RoutePage()
class ProductDetailScreen extends StatefulWidget {
  // ¿Por que pasamos 2 parametros que servirían para lo mismo?
  // La vista quedará lista para el uso de deep linking, permitiendo que se pueda acceder a esta pantalla directamente de los servicios
  // SI la vista trae un id proporcionado, se utilizará para cargar el producto correspondiente
  // SI la vista trae un producto, se utilizará directamente
  // Así evitamos que el usuario tenga que esperar a que se cargue el producto
  final int? id;
  final ProductDetailEntity? product;
  const ProductDetailScreen(
      {super.key, @PathParam('id') this.id, this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.product != null) {
      return ProductDetailView(product: widget.product!);
    }

    if (widget.id != null) {
      return ProductDetailLoader(id: widget.id!);
    }

    return ErrorStateScreen(
      messageErrorToUser: 'Producto no encontrado',
      nameButton: 'Volver',
      onRetry: () => context.pop(),
    );
  }
}

class ProductDetailLoader extends ConsumerWidget {
  final int id;

  const ProductDetailLoader({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(productDetailProvider(id)).when(
          data: (product) => ProductDetailView(product: product),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => ErrorStateScreen(
            messageErrorToUser: error.toString(),
            mainAxisAlignment: MainAxisAlignment.center,
            nameButton: 'Intentar de nuevo',
            needsBackButton: true,
            onRetry: () {
              ref.invalidate(productDetailProvider(id));
            },
          ),
        );
  }
}

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
                        child: Hero(
                            tag: 'product_image_${widget.product.id}',
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CachedNetworkImage(
                                  imageUrl: widget.product.image),
                            )),
                      ),
                      Positioned(
                          top: 10,
                          left: 10,
                          child: const BackButton()),
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
                          child: RatingStars(
                            value: widget.product.rating.rate,
                            starCount: 5,
                            starSize: 30,
                            valueLabelColor: widget.product.rating.rate >= 4
                                ? Colors.green
                                : (widget.product.rating.rate >= 2
                                    ? Colors.amber
                                    : Colors.red),
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
