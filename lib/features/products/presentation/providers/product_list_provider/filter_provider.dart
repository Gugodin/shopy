import 'package:riverpod/riverpod.dart';

import '../../../../../core/core.dart';

final filterProvider = StateProvider<List<TypeFilter>>((ref) {
  return [];
});