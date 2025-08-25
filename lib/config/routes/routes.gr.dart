// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:shopy/features/products/domain/domain.dart' as _i5;
import 'package:shopy/features/products/presentation/screens/product_detail_screen/product_detail_screen.dart'
    as _i1;
import 'package:shopy/features/products/presentation/screens/products_list_screen/products_list_screen.dart'
    as _i2;

/// generated route for
/// [_i1.ProductDetailScreen]
class ProductDetailRoute extends _i3.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i4.Key? key,
    int? id,
    _i5.ProductDetailEntity? product,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         ProductDetailRoute.name,
         args: ProductDetailRouteArgs(key: key, id: id, product: product),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'ProductDetailRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProductDetailRouteArgs>(
        orElse: () => ProductDetailRouteArgs(id: pathParams.optInt('id')),
      );
      return _i1.ProductDetailScreen(
        key: args.key,
        id: args.id,
        product: args.product,
      );
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({this.key, this.id, this.product});

  final _i4.Key? key;

  final int? id;

  final _i5.ProductDetailEntity? product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, id: $id, product: $product}';
  }
}

/// generated route for
/// [_i2.ProductsListScreen]
class ProductsListRoute extends _i3.PageRouteInfo<void> {
  const ProductsListRoute({List<_i3.PageRouteInfo>? children})
    : super(ProductsListRoute.name, initialChildren: children);

  static const String name = 'ProductsListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.ProductsListScreen();
    },
  );
}
