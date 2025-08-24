import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:shopy/core/components/category_chip.dart';
import 'package:shopy/core/components/components.dart';
import 'package:shopy/features/products/domain/domain.dart';

@RoutePage()
class ProductDetailScreen extends StatefulWidget {
  final int id;
  const ProductDetailScreen({super.key, @PathParam('id') required this.id});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductDetailEntity product;

  @override
  void initState() {
    super.initState();
    // Fetch product details using the provided id
    product = ProductDetailEntity(
        id: widget.id,
        title: 'Mens Casual Premium Slim Fit T-Shirts',
        price: 29.99,
        description:
            'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',
        category: Category.mensClothing,
        rating: Rating(rate: 4.5, count: 100),
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png");
  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
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
                            tag: 'product_image_${widget.id}',
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child:
                                  CachedNetworkImage(imageUrl: product.image),
                            )),
                      ),
                      Positioned(
                          top: 10,
                          left: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () => context.pop(),
                                icon: const Icon(Icons.arrow_back)),
                          )),
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
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      CategoryChip(label: product.category.displayName),
                      Text(
                        '\$${product.price}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        product.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Expanded(
                          flex: 1,
                          child: RatingStars(
                            value: product.rating.rate,
                            starCount: 5,
                            starSize: 30,
                            valueLabelColor: product.rating.rate >= 4
                                ? Colors.green
                                : (product.rating.rate >= 2
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
