import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping/core/di/locator.dart';

Future<void> initAppConfig() async {

  await Firebase.initializeApp();
  setUpLocator();
}
