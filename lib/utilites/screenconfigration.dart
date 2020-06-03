import 'package:flutter/material.dart';

enum ScreenType { SMALL, MEDIUM, LARGE }

class ScreenConfig {
  double screenWidth;
  double screenHeight;

  ScreenType screenType;

  void _setScreen() {
    if (this.screenWidth >= 0 && this.screenWidth <330) {
      this.screenType = ScreenType.SMALL;
    }
    if (this.screenWidth >= 330 && this.screenWidth < 490) {
      this.screenType = ScreenType.MEDIUM;
    }
    if (this.screenWidth >= 490) {
      this.screenType = ScreenType.LARGE;
    }
  }

  ScreenConfig(BuildContext context) {
    this.screenHeight = MediaQuery.of(context).size.height;
    this.screenWidth = MediaQuery.of(context).size.width;
    _setScreen();
  }


}

class Widgetsize {
  ScreenConfig screenConfig;

  double titleFontSize;
  double descriptionFontSize;
  double screenDotsWeight;
  double screenDotsHeight;
  double bottomWidth;
  double bottomHeight;
  double arrowDropDownSize;

  void _init() {
    switch (this.screenConfig.screenType) {
      case ScreenType.SMALL:
        this.titleFontSize = 22;
        this.descriptionFontSize=18;
        this.screenDotsHeight=4;
        this.screenDotsWeight=18;
        this.bottomHeight=35;
        this.bottomWidth=200;
        this.arrowDropDownSize=50;
        break;
      case ScreenType.MEDIUM:
        this.titleFontSize = 25;
        this.descriptionFontSize=22;
        this.screenDotsHeight=5;
        this.screenDotsWeight=20;
        this.bottomHeight=50;
        this.bottomWidth=300;
        this.arrowDropDownSize=70;
        break;
      case ScreenType.LARGE:
        this.titleFontSize = 32;
        this.descriptionFontSize=25;
        this.screenDotsHeight=5;
        this.screenDotsWeight=25;
        this.bottomHeight=50;
        this.bottomWidth=300;
        this.arrowDropDownSize=90;

        break;
      default:
        this.titleFontSize = 28;
        this.descriptionFontSize=20;
        this.screenDotsHeight=6;
        this.screenDotsWeight=28;
        this.bottomHeight=50;
        this.bottomWidth=300;
        this.arrowDropDownSize=50;

    }

  }

  Widgetsize(ScreenConfig screenConfig) {
    this.screenConfig = screenConfig;
    _init();
  }


}
