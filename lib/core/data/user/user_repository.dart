
import 'package:shopping/core/data/user/user_local_data_source.dart';
import 'package:shopping/core/data/user/user_remote_data_source.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/dtos/user_dto.dart';
import 'package:shopping/core/models/user_model.dart';

import 'i_user_repository.dart';

class UserRepository implements IUserRepository {
  final UserRemotoDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;

  UserRepository({
    UserRemotoDataSource? userRemoteDataSource,
    UserLocalDataSource? userLocalDataSource,
  }) : _userLocalDataSource = userLocalDataSource ?? locator<UserLocalDataSource>(),
        _userRemoteDataSource = userRemoteDataSource ?? locator<UserRemotoDataSource>();

  @override
  Future<UserDTO> authUser(UserModel user) {
   return _userRemoteDataSource.authUser(user);
  }

  @override
  Future<bool> registerUser(UserModel user) {
   return  _userRemoteDataSource.registerUser(user);
  }

  @override
  UserModel get user => UserModel.formUserDTO(_userLocalDataSource.user);

  @override
  void updateUser(UserDTO user) => _userLocalDataSource.setUser(user);

  @override
  Future<void> logoutUser() {
  return _userRemoteDataSource.logoutUser();
  }

}
