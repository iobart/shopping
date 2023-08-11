import 'package:shopping/core/data/user/i_user_repository.dart';
import 'package:shopping/core/di/locator.dart';

class LogoutCurrentUserUseCase {
  final IUserRepository _iUserRepository;

  LogoutCurrentUserUseCase({IUserRepository? iUserRepository})
      : _iUserRepository = iUserRepository ?? locator<IUserRepository>();

  Future<void> invoke() async {
    return _iUserRepository.logoutUser();

  }
}