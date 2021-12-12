import 'package:flutter/material.dart';

class KeyboardDismissable extends StatelessWidget {
  const KeyboardDismissable({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: child,
    );
}