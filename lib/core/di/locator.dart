import 'package:get_it/get_it.dart';
import 'package:shopping/core/api/shopping_api.dart';
import 'package:shopping/core/data/home/i_menu_repository.dart';
import 'package:shopping/core/data/home/menu_remote_data_source.dart';
import 'package:shopping/core/data/home/menu_repository.dart';
import 'package:shopping/core/data/user/i_user_repository.dart';
import 'package:shopping/core/data/user/user_local_data_source.dart';
import 'package:shopping/core/data/user/user_remote_data_source.dart';
import 'package:shopping/core/data/user/user_repository.dart';
import 'package:shopping/core/use_cases/create_menu_product_use_case.dart';
import 'package:shopping/core/use_cases/get_current_user_use_case.dart';
import 'package:shopping/core/use_cases/get_menu_product_use_case.dart';
import 'package:shopping/core/use_cases/login_use_case.dart';
import 'package:shopping/core/use_cases/logout_current_user_use_case.dart';
import 'package:shopping/core/use_cases/register_user_use_case.dart';
import 'package:shopping/ui/views/home/home_view_model.dart';
import 'package:shopping/ui/views/login/login_view_model.dart';

/// The service locator instance that contains all LazySingletons that will be reused
/// across the application.
GetIt locator = GetIt.instance..allowReassignment = true;

void setUpLocator() {
  // Apis
  locator
    ..registerLazySingleton<ShoppingApi>(() => ShoppingApi())

    // View Models
    ..registerLazySingleton<LoginViewModel>(() => LoginViewModel())
    ..registerLazySingleton<HomeViewModel>(() => HomeViewModel())

    //User Cases
    ..registerLazySingleton<RegisterUserUseCase>(() => RegisterUserUseCase())
    ..registerLazySingleton<LoginUseCase>(() => LoginUseCase())
    ..registerLazySingleton<GetCurrentUserUseCase>(() => GetCurrentUserUseCase())
    ..registerLazySingleton<LogoutCurrentUserUseCase>(() => LogoutCurrentUserUseCase())
    ..registerLazySingleton<CreateMenuProductUseCase>(() => CreateMenuProductUseCase())
    ..registerLazySingleton<GetMenuProductUseCase>(() => GetMenuProductUseCase())

    //repositories
    ..registerLazySingleton<IUserRepository>(() => UserRepository())
    ..registerLazySingleton<IMenuRepository>(() => MenuRepository())

    //data sources
    ..registerLazySingleton<UserRemotoDataSource>(() => UserRemotoDataSource())
    ..registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource())
    ..registerLazySingleton<MenuRemoteDataSource>(()=>MenuRemoteDataSource());
}
