import 'package:shopping/core/dtos/user_dto.dart';

class UserModel {
  String? id;
  String? email;
  String? password;

  UserModel({
     this.id,
     this.email,
     this.password,
  });

  UserModel.formUserDTO(UserDTO userDTO) {
    id = userDTO.id;
    email = userDTO.email;
    password = userDTO.password;
  }


  static UserModel? fromDTO({
    required UserDTO dto,
    required bool hasPassword
  }) {
    if (dto.id == null || dto.email == null) {
      return null;
    }
    return UserModel(
      id: dto.id,
      email: dto.email,
      password: dto.password,
    );
  }
}
