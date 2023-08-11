import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/core/dtos/menu_dto.dart';
import 'package:shopping/ui/views/home/home_view_model.dart';

import 'home_dialog_view.dart';

class HomeListMenuView extends StatelessWidget {
  final HomeViewModel _homeViewModel;

  HomeListMenuView({Key? key, HomeViewModel? homeViewModel})
      : _homeViewModel = homeViewModel ?? locator<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<MenuDTO>>(
      stream: _homeViewModel.getMenuProduct,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const SizedBox();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if(snapshot.data!.docs.isEmpty){
          return  Center(
            child: HomeProductForm(),
          );
        }
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(thickness: 1),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final doc = snapshot.data!.docs[index];
              final MenuDTO card = doc.data();
              return Slidable(
                key: const ValueKey(0),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    closeOnCancel: true,
                    confirmDismiss: () async {
                      return false;
                    },
                    onDismissed: () {},
                  ),
                  children: [
                    SlidableAction(
                      autoClose: true,
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      onPressed: (ctx) async =>
                      await _deleteAction(context, doc),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    card.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    card.price.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing:const Icon(
                    Icons.production_quantity_limits_sharp,
                    color: Colors.greenAccent,
                    size: 22,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
  _deleteAction(context,doc){
    return null;
  }
}