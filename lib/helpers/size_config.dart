import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textMultiplier = blockSizeHorizontal;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;
  }

  static double getBigTitleSize() => screenWidth * 0.07;
  static double getTitleSize() => screenWidth * 0.04;
  static double getEdgeInsets() => screenWidth * 0.1;
  static double textFieldWidth() => screenWidth * 0.5;
  static double getHorizontalSpacer() =>  screenWidth * 0.05;
  static double getVerticalSpacer() =>  screenHeight * 0.05;
}
