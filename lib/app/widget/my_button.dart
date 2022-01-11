import 'package:xepa/app/config/config.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({Key? key, required this.onTap, required this.label, this.child, color}) : super(key: key) {
    buttonDecoration = BoxDecoration(
      color: color ?? MyColors.primaryColor,
      borderRadius: BorderRadius.circular(5.0),
    );
    labelStyle = MyTheme.typographyWhite.label1;
    highlightColor = MyColors.primaryColor;
    splashColor = MyColors.white70;
  }

  MyButton.white({Key? key, required this.onTap, required this.label, this.child }) : super(key: key) {
    buttonDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(color: MyColors.grey5, width: 2),
    );
    labelStyle = MyTheme.typographyWhite.label1.copyWith(color: MyColors.primaryColor, fontSize: 14);
    highlightColor = MyColors.primaryColor;
    splashColor = MyColors.white70;
  }

  MyButton.outlined({Key? key, required this.onTap, this.label = '', this.child}) : super(key: key) {
    buttonDecoration = BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(5.0),
    );
    labelStyle = MyTheme.typographyWhite.label1;
    highlightColor = Colors.grey[200];
    splashColor = MyColors.grey4;
  }

  MyButton.disabled({Key? key, required this.label}) : super(key: key) {
    buttonDecoration = BoxDecoration(
      color: MyColors.grey4,
      borderRadius: BorderRadius.circular(5.0),
    );
    labelStyle = MyTheme.typographyWhite.label1;
    highlightColor = MyColors.grey4;
    splashColor = MyColors.grey4;
  }

  Function()? onTap;
  Widget? child;
  String label;
  BoxDecoration? buttonDecoration;
  TextStyle? labelStyle;
  Color? highlightColor;
  Color? splashColor;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    highlightColor: highlightColor,
    splashColor: splashColor,
    child: Container(
      height: MySizes.buttonHeight,
      decoration: buttonDecoration,
      child: Center(
        child: child ??
            Text(
              label,
              style: labelStyle,
            ),
      ),
    ),
  );
}
