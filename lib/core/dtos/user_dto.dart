import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class UserDto{

  String email;
  String password;

  UserDto({
    required this.email,
    required this.password,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}