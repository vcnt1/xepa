import 'package:flutter/material.dart';

import 'device.dart';

class MySizes {
  const MySizes();

  static final Device _device = Device();

  static const double mainHorizontalMargin = 20;
  static const double mainVerticalMargin = 30;
  static const EdgeInsets mainHorizontalEdgeInsets = EdgeInsets.symmetric(horizontal: mainHorizontalMargin);

  static const double alternativeHorizontalMargin = 30;
  static const double alternativeVerticalMargin = 50;
  static const EdgeInsets alternativeEdgeInsets = EdgeInsets.symmetric(horizontal: alternativeHorizontalMargin, vertical: alternativeVerticalMargin);
  static const EdgeInsets alternativeHorizontalEdgeInsets = EdgeInsets.symmetric(horizontal: alternativeHorizontalMargin);

  static double buttonHeight = 40;

  static const double gradientVerticalMargin = 50;
  static const double bottomWidgetHeightModal = 100;

  static double menuItemWidgth = (_device.screenWidth - (mainHorizontalMargin * 2) - 20)/3;
  static double menuItemHeight = _device.screenHeight * .15;

  static double bottomButtonContainer = buttonHeight + (mainHorizontalMargin * 2);
}