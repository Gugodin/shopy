import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopy/features/products/presentation/providers/repository_provider/repository_provider.dart';

import '../../../../../core/core.dart';
import '../../../domain/domain.dart';

final getProductByIdUCProvider = Provider<GetDetailProductUC>((ref) {
  return GetDetailProductUC(ref.watch(repositoryProvider));
});

final productDetailProvider =
    FutureProvider.family<ProductDetailEntity, int>((ref, id) async {
  final getDetailProductUC = ref.watch(getProductByIdUCProvider);
  final result = await getDetailProductUC.call(params: id);

  //TODO: Simular un error al momento de usar deep linking
  // throw 'Esto es una prueba de error';

  switch (result) {
    case DataSuccess<ProductDetailEntity>():
      return result.data;
    case DataDioError<ProductDetailEntity>():
      throw result.userMessage!;
    case DataGeneralError<ProductDetailEntity>():
      throw result.userMessage!;
    default:
      throw 'Error desconocido';
  }
});
