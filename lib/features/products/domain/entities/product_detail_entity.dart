import 'product_entity.dart';

class ProductDetailEntity extends ProductEntity {
  ProductDetailEntity(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.category,
      required super.image});
}
