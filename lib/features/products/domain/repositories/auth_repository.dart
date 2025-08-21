import 'package:replacenamehere/core/core.dart';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<DataState<UserEntity>> login(String email, String password);
}
