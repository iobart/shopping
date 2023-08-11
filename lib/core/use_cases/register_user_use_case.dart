import 'package:shopping/core/data/user/i_user_repository.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/models/user_model.dart';


class RegisterUserUseCase {
  final IUserRepository _iUserRepository;

  RegisterUserUseCase({
    IUserRepository? iUserRepository,
  }) : _iUserRepository = iUserRepository ?? locator<IUserRepository>();

  Future <bool> invoke(String email, String password) async {
    final UserModel user = UserModel(email: email, password:password);
    return await _iUserRepository.registerUser(user);
  }
}
