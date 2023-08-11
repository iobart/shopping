import 'package:shopping/core/dtos/user_dto.dart';

class UserLocalDataSource{

  UserDTO _user = UserDTO();

  UserDTO get user => _user;

  void setUser(UserDTO user) => _user = user;
}