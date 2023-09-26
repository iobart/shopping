import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/core/api/shopping_api.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/dtos/menu_dto.dart';
import 'package:shopping/core/models/menu_model.dart';

class MenuRemoteDataSource{
  final ShoppingApi _shoppingApi;
  MenuRemoteDataSource({
    ShoppingApi? shoppingApi,
  }) : _shoppingApi = shoppingApi ?? locator<ShoppingApi>();
  Future<bool> createMenu(MenuModel menu){
    return _shoppingApi.createMenu(menu);

  }
  Stream<QuerySnapshot<MenuDTO>>? getMenu(){
    return _shoppingApi.getMenu();
  }
}