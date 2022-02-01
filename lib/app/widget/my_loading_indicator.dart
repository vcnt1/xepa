import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xepa/app/config/colors.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({Key? key, this.color}) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: color ?? MyColors.primaryColor,
      size: 50.0,
    );
  }
}
