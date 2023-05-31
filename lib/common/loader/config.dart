import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Configure the Easy Loader Indicator
/// from flutter_easy_loading package
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
        fontFamily: "Gilroy",
        fontStyle: FontStyle.normal,
        fontSize: 13,);
  }
}