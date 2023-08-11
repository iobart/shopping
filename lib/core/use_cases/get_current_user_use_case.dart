import 'package:shopping/core/data/user/i_user_repository.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/models/user_model.dart';

class GetCurrentUserUseCase {
  final IUserRepository _iUserRepository;

  GetCurrentUserUseCase({
    IUserRepository? iUserRepository,
  }) : _iUserRepository = iUserRepository ?? locator<IUserRepository>();

  UserModel invoke() {
    return _iUserRepository.user;
  }
}
