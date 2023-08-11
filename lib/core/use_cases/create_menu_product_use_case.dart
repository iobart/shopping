import 'package:shopping/core/data/home/i_menu_repository.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/models/menu_model.dart';

class CreateMenuProductUseCase {
  final IMenuRepository _iMenuRepository;

  CreateMenuProductUseCase({
    IMenuRepository? iMenuRepository,
  }) : _iMenuRepository = iMenuRepository ?? locator<IMenuRepository>();

  Future <bool> invoke(String name, String description, double price, int stock) {
    MenuModel menu = MenuModel(name: name, description: description, price: price, stock: stock,);
   return _iMenuRepository.createMenu(menu);
  }
}