import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/dtos/menu_dto.dart';
import 'package:shopping/core/models/user_model.dart';
import 'package:shopping/core/use_cases/create_menu_product_use_case.dart';
import 'package:shopping/core/use_cases/get_current_user_use_case.dart';
import 'package:shopping/core/use_cases/get_menu_product_use_case.dart';
import 'package:shopping/core/use_cases/logout_current_user_use_case.dart';

class HomeViewModel extends ChangeNotifier {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogoutCurrentUserUseCase _logoutCurrentUserUseCase;
  final CreateMenuProductUseCase _createMenuProductUseCase;
  final GetMenuProductUseCase _getMenuProductUseCase;
  UserModel? _user;

  HomeViewModel({
    GetCurrentUserUseCase? getCurrentUserUseCase,
    LogoutCurrentUserUseCase? logoutCurrentUserUseCase,
    CreateMenuProductUseCase? createMenuProductUseCase,
    GetMenuProductUseCase? getMenuProductUseCase,
  })  : _logoutCurrentUserUseCase =
            logoutCurrentUserUseCase ?? locator<LogoutCurrentUserUseCase>(),
        _getMenuProductUseCase = getMenuProductUseCase ??
            locator<GetMenuProductUseCase>(),
        _createMenuProductUseCase = createMenuProductUseCase ??
            locator<CreateMenuProductUseCase>(),
        _getCurrentUserUseCase =
            getCurrentUserUseCase ?? locator<GetCurrentUserUseCase>();

  UserModel get currentUser => _getCurrentUserUseCase.invoke();

  Future<void> getCurrentUser() async {
    _user = _getCurrentUserUseCase.invoke();
    print(_user?.email);
    notifyListeners();
  }

  void logout() {
    try {
      _logoutCurrentUserUseCase.invoke();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> createMenuProduct({
    String? name,
    String? description,
    double? price,
    int? stock,
  }) async {
    try {
      final isCreatedProduct =
      await _createMenuProductUseCase.invoke(name!, description!, price!, stock!);
      if (isCreatedProduct != null) {
        _getMenuProductUseCase.invoke();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }


  Stream<QuerySnapshot<MenuDTO>>? get getMenuProduct  => _getMenuProductUseCase.invoke();

}
