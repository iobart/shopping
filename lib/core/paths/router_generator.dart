import 'package:flutter/material.dart';
import 'package:shopping/core/constansts/desing_constants.dart';
import 'package:shopping/core/constansts/route_constanst.dart';
import 'package:shopping/core/utils/image_utils.dart';
import 'package:shopping/ui/views/home/home_view.dart';
import 'package:shopping/ui/views/home/home_view_model.dart';
import 'package:shopping/ui/views/login/login_view.dart';
import 'package:shopping/ui/views/login/login_view_model.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        final LoginViewModel viewModel = settings.arguments != null
            ? settings.arguments as LoginViewModel
            : LoginViewModel();
        return MaterialPageRoute<void>(
            builder: (BuildContext context) => LoginView(
                  loginViewModel: viewModel,
                ));
      case homeRoute:
        final HomeViewModel viewModel = settings.arguments != null
            ? settings.arguments as HomeViewModel
            : HomeViewModel();
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: getLottieFromJson(
                  fit: BoxFit.contain, height: 300, lottie: kWrongRoute),
            ),
          ),
        );
    }
  }
}
