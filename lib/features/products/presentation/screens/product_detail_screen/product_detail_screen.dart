import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:shopy/features/products/domain/domain.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/core.dart';
import 'widgets/widget.dart';

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
      return Skeletonizer(
          enabled: false, child: ProductDetailView(product: widget.product!));
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
