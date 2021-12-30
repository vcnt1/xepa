import 'package:flutter/material.dart';

class MyColors {
  const MyColors();

  static Color get primaryColor => const Color(0xFFF27523);
  static Color get backgroundColor => const Color(0xFFFFF7F1);
  static Color get statusBar => const Color(0xFFD66821);

  static Color get red => Colors.red;

  static Color get grey1 => const Color(0xFF252525);
  static Color get grey2 => const Color(0xFF545454);
  static Color get grey3 => const Color(0xFF646464);
  static Color get grey4 => const Color(0xFFC4C4C4);
  static Color get grey5 => const Color(0xFFEFEFEF);

  static Color get green => const Color(0xFF219653);
  static Color get blue => const Color(0xFF56CCF2);
  static Color get greenBlueish50 => const Color.fromRGBO(90, 215, 223, 50);
  static Color get greenBlueish20 => const Color(0xFFA5E9EE);
  static Color get white70 => const Color.fromRGBO(255, 255, 255, 70);

  static Color get skeletonHighlight => const Color.fromRGBO(255, 255, 255, 20);
  static Color get skeletonBase => const Color.fromRGBO(255, 255, 255, 70);
  static Color get skeletonHighlightAlt => const Color(0xFFF1FCFE);
  static Color? get skeletonBaseAlt => Colors.grey[200];
}
