import 'package:shopping/core/data/user/i_user_repository.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/models/user_model.dart';

class LoginUseCase {
  final IUserRepository _iUserRepository;

  LoginUseCase({IUserRepository? iUserRepository})
      : _iUserRepository = iUserRepository ?? locator<IUserRepository>();

  Future<UserModel> invoke(String email, String password) async {

    final UserModel user = UserModel(email: email, password: password,);
    final b = await _iUserRepository.authUser(user);
    _iUserRepository.updateUser(b);
    return _iUserRepository.user;
  }
}