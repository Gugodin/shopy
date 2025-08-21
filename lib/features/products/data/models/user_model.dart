import '../../domain/domain.dart';

class UserModel extends UserEntity {
    UserModel();

    // Factory que simula la conversión de JSON a UserModel
    // En una implementación real, deberías mapear los campos del JSON a los atributos de UserModel
    factory UserModel.fromJson(Map<String, dynamic> json) =>
        UserModel();
}
