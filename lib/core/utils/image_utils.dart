import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Method loading a lottie image
Widget getLottieFromJson({
  required String lottie,
  BoxFit fit = BoxFit.cover,
  double? height,
  bool repeat = false,
  double? width,
  LottieDelegates? delegates
}) {
  return Lottie.asset(
      lottie,
      fit: fit,
      height: height,
      repeat: repeat,
      width: width,
      delegates: delegates
  );
}