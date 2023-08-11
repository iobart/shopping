import 'package:json_annotation/json_annotation.dart';
import 'package:shopping/core/models/user_model.dart';
part 'user_dto.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class UserDTO{
  String? id;
  String? email;
  String? password;

  UserDTO({
     this.id,
     this.email,
     this.password,
  });

  factory UserDTO.fromModel({ required UserModel model }) {
    return UserDTO(
      id: model.id,
      email: model.email,
      password: model.password,
    );
  }

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}