import 'product_entity.dart';

class ProductDetailEntity extends ProductEntity {
  ProductDetailEntity(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.category,
      required super.image,
      required super.rating});
  ProductDetailEntity.fromProductEntity(ProductEntity product)
      : super(
          id: product.id,
          title: product.title,
          price: product.price,
          description: product.description,
          category: product.category,
          image: product.image,
          rating: product.rating,
        );
}
