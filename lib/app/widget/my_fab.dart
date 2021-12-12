import 'package:xepa/app/config/config.dart';
import 'package:flutter/material.dart';

class MyFab extends StatelessWidget {
  const MyFab({Key? key, required this.icon, required this.onTap, this.size = 60.0}) : super(key: key);

  final IconData icon;
  final double size;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      highlightColor: Colors.white,
      splashColor: MyColors.grey5,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: MyColors.grey5,
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: MyColors.grey1,
          ),
        ),
      ),
    );
  }
}
