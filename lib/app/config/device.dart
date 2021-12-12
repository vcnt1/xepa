import 'package:flutter/material.dart';

enum BuildMode { debug, profile, release }

class Device {
  static final Device _instance = Device._internal();

  factory Device() {
    return _instance;
  }

  Device._internal();

  double screenWidth = 0;
  double screenHeight = 0;
  double aspectRatio = 0;
  double pixelRatio = 0;
  double safeAreaHorizontal = 0;
  double safeAreaVertical = 0;

  void loadValues(MediaQueryData mediaQueryData) {
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    aspectRatio = screenWidth / screenHeight;
    safeAreaHorizontal = mediaQueryData.padding.left + mediaQueryData.padding.right;
    safeAreaVertical = mediaQueryData.padding.top + mediaQueryData.padding.bottom;
    pixelRatio = mediaQueryData.devicePixelRatio;
  }

  static BuildMode currentBuildMode() {
    if (const bool.fromEnvironment('dart.vm.product')) {
      return BuildMode.release;
    }
    var result = BuildMode.profile;

    assert(() {
      result = BuildMode.debug;
      return true;
    }());
    return result;
  }
}
