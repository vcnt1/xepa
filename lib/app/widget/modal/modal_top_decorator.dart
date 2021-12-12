import 'package:xepa/app/config//colors.dart';
import 'package:flutter/material.dart';

class ModalTopDecorator extends StatelessWidget {
  const ModalTopDecorator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 10,
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: MyColors.grey4,
        ),
      ),
    );
  }
}
