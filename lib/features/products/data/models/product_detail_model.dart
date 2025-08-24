import 'package:shopy/core/core.dart';

import '../../domain/domain.dart';

class ProductDetailModel extends ProductDetailEntity {
  ProductDetailModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.category,
      required super.image,
      required super.rating});

  // Factory que simula la conversión de JSON a ProductModel
  // En una implementación real, deberías mapear los campos del JSON a los atributos de ProductModel
  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: Category.fromApiValue(json['category']),
        image: json['image'],
        rating: Rating(
          rate: (json['rating']['rate'] as num).toDouble(),
          count: json['rating']['count'],
        ),
      );
}
