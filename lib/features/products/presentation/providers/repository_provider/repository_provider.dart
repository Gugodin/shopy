import 'package:riverpod/riverpod.dart';

import '../../../data/data.dart' show ProductsRepositoryImp;


final repositoryProvider = Provider((ref) {
  return ProductsRepositoryImp();
});