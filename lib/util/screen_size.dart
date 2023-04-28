import 'package:flutter/material.dart';

class ScreenSize {
  BuildContext context;
  static double? _screenWidth;
  static double? _screenHeight;
  ScreenSize({required this.context});

  double getScreenWidth() {
    _screenWidth ??= MediaQuery.of(context).size.width;
    return _screenWidth!;
  }

  double getScreenHeight() {
    _screenHeight ??= MediaQuery.of(context).size.height;
    return _screenHeight!;
  }

  bool isTablet() => getScreenWidth() > 800;

  bool isFullScreen() => getScreenWidth() > 1000;
}
