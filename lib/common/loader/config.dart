import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// Configure the Easy Loader Indicator
class ConfigEasyLoader {
  static void darkTheme() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.dark
      ..maskType = EasyLoadingMaskType.black
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..userInteractions = false
      ..dismissOnTap = false
      ..textStyle = TextStyle(
        color: Colors.grey[300],
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 13,);
  }
}