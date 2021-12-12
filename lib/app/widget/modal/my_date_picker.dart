import 'package:xepa/app/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker({Key? key, this.initialDate, required this.onDateTimeChanged}) : super(key: key);

  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: Device().screenHeight * .3,
          child: CupertinoDatePicker(
            maximumDate: DateTime.now().add(const Duration(hours: 23, minutes: 59, seconds: 59, milliseconds: 59, microseconds: 59)),
            mode: CupertinoDatePickerMode.date,
            initialDateTime: initialDate ?? DateTime.now(),
            onDateTimeChanged: onDateTimeChanged,
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            decoration: MyDecoration.topBorderBox,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'Fechar',
                style: MyTheme.typographyBlack.label1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
