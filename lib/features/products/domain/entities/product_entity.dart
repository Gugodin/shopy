
// Clase producto que se deberá llenar con los datos del producto
// Aún no se ha definido qué datos tendrá el producto, debido a que se esta utilizando una API de ejemplo
class ProductEntity {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });
}
