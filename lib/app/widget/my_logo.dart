import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({Key? key, required this.width, this.color}) : super(key: key);

  final double width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "xepa-logo-babyyy",
      child: SvgPicture.asset(
        'assets/images/xepa-logo.svg',
        semanticsLabel: 'Xepa! Logo',
        width: width,
        color: color,
      ),
    );
  }
}
