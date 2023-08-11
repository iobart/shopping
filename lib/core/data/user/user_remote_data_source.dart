import 'package:shopping/core/api/shopping_api.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/dtos/user_dto.dart';
import 'package:shopping/core/models/user_model.dart';

class UserRemotoDataSource  {
  final ShoppingApi _shoppingApi;

  UserRemotoDataSource({
    ShoppingApi? shoppingApi,
  }) : _shoppingApi = shoppingApi ?? locator<ShoppingApi>();

  Future<bool> registerUser(UserModel user) async {
    UserDTO userDto = UserDTO.fromModel(model: user);
    return await  _shoppingApi.registerUser(userDto);
  }
  Future<UserDTO> authUser(UserModel user) async {
    UserDTO userDto = UserDTO.fromModel(model: user);
    return await  _shoppingApi.authUser(userDto);
  }

  Future<void> logoutUser() async {
    return await  _shoppingApi.logoutUser();
  }
}