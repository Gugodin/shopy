
import 'package:replacenamehere/core/core.dart';

import '../domain.dart';

class LoginUseCase extends UseCase<DataState<UserEntity>, LoginParams> {

  final AuthRepository _authRepository;
  
  LoginUseCase(this._authRepository);

  @override
  Future<DataState<UserEntity>> call({LoginParams? params}) async {
    if (params == null) {
      throw Exception('LoginParams cannot be null');
    }
    return _authRepository.login(params.email, params.password);
  }
}


class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}