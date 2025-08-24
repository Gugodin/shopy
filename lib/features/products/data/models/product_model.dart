
import '../../domain/domain.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.category,
      required super.rating,
      required super.image});

  // Factory que simula la conversión de JSON a ProductModel
  // En una implementación real, deberías mapear los campos del JSON a los atributos de ProductModel
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        title: json['title'],
        price: (json['price'] as num).toDouble(),
        description: json['description'],
        category: Category.fromApiValue(json['category']),
        image: json['image'],
        rating: Rating(
          rate: (json['rating']['rate'] as num).toDouble(),
          count: json['rating']['count'],
        ),
      );
}


