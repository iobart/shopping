

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/core/data/home/i_menu_repository.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/dtos/menu_dto.dart';

class GetMenuProductUseCase{
  final IMenuRepository _imenuProductRepository;

  GetMenuProductUseCase({
    IMenuRepository? menuProductRepository,
  }) : _imenuProductRepository = menuProductRepository ?? locator<IMenuRepository>();

  Stream<QuerySnapshot<MenuDTO>>? invoke()  {
    return  _imenuProductRepository.getMenu();
  }
}