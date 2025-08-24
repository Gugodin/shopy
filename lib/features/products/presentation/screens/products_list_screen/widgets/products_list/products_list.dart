import 'package:flutter/material.dart';

import '../../../../../domain/domain.dart';
import 'card_product.dart';

class ProductsList extends StatelessWidget {
  ProductsList({super.key});

  final List<ProductEntity> products = [
    ProductEntity(
        id: 1,
        title: 'Mens Casual Premium Slim Fit T-Shirts',
        price: 29.99,
        description:
            'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',
        category:Category.mensClothing ,
        rating: Rating(rate: 4.5, count: 100),
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png"),
    ProductEntity(
        id: 2,
        title: 'Product 2',
        price: 49.99,
        description: 'Description 2',
        category: Category.jewelery,
        rating: Rating(rate: 3.8, count: 50),
        image: "https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_t.png"),
    ProductEntity(
        id: 3,
        title: 'Product 3',
        price: 19.99,
        description: 'Description 3',
        category: Category.mensClothing,
        rating: Rating(rate: 4.0, count: 75),
        image:
            "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png"),
    ProductEntity(
        id: 4,
        title: 'Product 4',
        price: 99.99,
        description: 'Description 4',
        category: Category.electronics,
        rating: Rating(rate: 4.9, count: 200),
        image: "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png"),
    ProductEntity(
        id: 5,
        title: 'Product 5',
        price: 59.99,
        description: 'Description 5',
        category: Category.jewelery,
        rating: Rating(rate: 4.2, count: 120),
        image: "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      separatorBuilder: (context, index) => const SizedBox(height: 25.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return CardProduct(product: product);
      },
    );
  }
}
