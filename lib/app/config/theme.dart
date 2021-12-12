import 'package:xepa/app/config/config.dart';
import 'package:flutter/material.dart';

class MyTheme {
  const MyTheme();

  static MyColors get colors => MyColors();

  static ThemeData get light => ThemeData(
      primaryColor: MyColors.primaryColor,
      backgroundColor: MyColors.backgroundColor,
      dialogBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        modalBackgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ));

  static MyText get typographyBlack => MyText(
        default1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: MyColors.grey1,
        ),
        default2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: MyColors.grey3,
        ),
        label1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: MyColors.grey3,
        ),
        label2: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: MyColors.grey3,
        ),
        label3: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: MyColors.grey3,
        ),
        headline1: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: MyColors.grey1,
        ),
        headline2: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: MyColors.grey1,
        ),
        headline3: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: MyColors.grey1,
        ),
        headline4: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: MyColors.grey1,
        ),
        headline5: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: MyColors.grey1,
        ),
        headline6: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: MyColors.grey1,
        ),
        subtitle1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: MyColors.grey2,
        ),
      );

  static MyText get typographyWhite => MyText(
        default1: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        default2: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        label1: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        label2: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        label3: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        headline1: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        headline2: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        headline3: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        headline4: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        headline5: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        headline6: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      );
}
