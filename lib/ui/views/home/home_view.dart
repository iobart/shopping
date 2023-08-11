import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shopping/core/constansts/route_constanst.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/ui/views/home/home_view_model.dart';
import 'package:shopping/ui/views/home/widgets/home_dialog_view.dart';
import 'package:shopping/ui/views/home/widgets/home_list_menu_view.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel _homeViewModel;

  HomeView({
    Key? key,
    HomeViewModel? homeViewModel,
  })  : _homeViewModel = homeViewModel ?? locator<HomeViewModel>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [iconButton(context)],
      ),
      body:  Center(
        child:HomeListMenuView(),
      ),
      floatingActionButton: SpeedDial(
        // Íconos para el Speed Dial
        onPress: () {
          _homeViewModel.getCurrentUser();
        },
        animatedIcon: AnimatedIcons.add_event,
      ),
    );
  }

  Widget iconButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () {
        _homeViewModel.logout();
        Navigator.pushNamed(context, loginRoute);
      },
    );
  }
}
