import 'dart:ui';

import 'package:xepa/app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatefulWidget {
  MyTextField({
    required this.key,
    required this.onChanged,
    required this.labelText,
    this.helperText,
    this.errorText,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
  });

  final Key key;
  final ValueChanged onChanged;
  final String labelText;
  final String? helperText;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: MyTheme.typographyBlack.label1,
          ),
          const SizedBox(height: 10),
          TextField(
            key: widget.key,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
              errorText: widget.errorText,
              helperText: widget.helperText,
              focusedBorder: MyDecoration.focusedInputBorder,
              enabledBorder: MyDecoration.enabledInputBorder,
              errorBorder: MyDecoration.errorInputBorder,
              focusedErrorBorder: MyDecoration.errorInputBorder,
              counterText: "",
            ),
            style: MyTheme.typographyBlack.default1,
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLength,
            scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          ),
        ],
      );
}
