import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/ui/views/home/home_view_model.dart';
import 'package:shopping/ui/views/login/login_view_model.dart';
import 'core/config/init_app_config.dart';
import 'core/constansts/route_constanst.dart';
import 'core/di/locator.dart';
import 'core/paths/router_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppConfig();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => locator<LoginViewModel>()),
    ChangeNotifierProvider(create: (_) => locator<HomeViewModel>()),
  ], child:  MyApp()));
}

class MyApp extends StatefulWidget {

   MyApp({super.key, });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final _mainkey = GlobalKey<FormState>();
    final FirebaseAuth auth = FirebaseAuth.instance;
    return MaterialApp(
      key: _mainkey,
      title: 'Shopping',
      initialRoute: auth.currentUser == null ? loginRoute : homeRoute,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
