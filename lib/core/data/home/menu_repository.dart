
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/dtos/menu_dto.dart';
import 'package:shopping/core/models/menu_model.dart';

import 'i_menu_repository.dart';
import 'menu_remote_data_source.dart';

class MenuRepository implements IMenuRepository {
  final MenuRemoteDataSource _menuRemoteDataSource;

  MenuRepository({
    MenuRemoteDataSource? menuRemoteDataSource,
  }) : _menuRemoteDataSource = menuRemoteDataSource?? locator<MenuRemoteDataSource>();

  @override
  Future<bool> createMenu(MenuModel menu) {
    // TODO: implement createMenu
   return _menuRemoteDataSource.createMenu(menu);
  }

  @override
  Future<bool> deleteProductMenu(String id) {
    // TODO: implement deleteProductMenu
    throw UnimplementedError();
  }

  @override
  Future<bool>  updateProductMenu(MenuModel menu) {
    // TODO: implement updateProductMenu
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot<MenuDTO>>? getMenu() {
    return _menuRemoteDataSource.getMenu();
  }

}