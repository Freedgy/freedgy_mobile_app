import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData data;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    data = MediaQuery.of(context);
    screenWidth = data.size.width;
    screenHeight = data.size.height;
    orientation = data.orientation;
  }
}

double getScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

double getScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}
