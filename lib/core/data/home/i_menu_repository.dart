import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/core/dtos/menu_dto.dart';
import 'package:shopping/core/models/menu_model.dart';

abstract class IMenuRepository {
  Future<bool> createMenu(MenuModel menu);

  Stream<QuerySnapshot<MenuDTO>>? getMenu();

  Future<bool> updateProductMenu(MenuModel menu);

  Future<bool> deleteProductMenu(String id);
}
