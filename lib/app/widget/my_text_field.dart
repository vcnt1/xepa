// import 'dart:ui';
//
// import 'package:xepa/app/config/config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class MyTextField extends StatefulWidget {
//   MyTextField({
//     required this.key,
//     required this.onChanged,
//     this.controller,
//     this.labelText,
//     this.helperText,
//     this.errorText,
//     this.keyboardType,
//     this.inputFormatters,
//     this.maxLength,
//   });
//
//   final key;
//   final Function onChanged;
//   final TextEditingController controller;
//   final String labelText;
//   final String helperText;
//   final String errorText;
//   final TextInputType keyboardType;
//   final int maxLength;
//   final List<TextInputFormatter> inputFormatters;
//
//   @override
//   _MyTextFieldState createState() => _MyTextFieldState();
// }
//
// class _MyTextFieldState extends State<MyTextField> {
//   TextEditingController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = widget.controller;
//   }
//
//   @override
//   Widget build(BuildContext context) => SizedBox(
//       height: 50,
//       child: TextField(
//         key: widget.key,
//         controller: controller,
//         onChanged: widget.onChanged,
//         keyboardType: widget.keyboardType ?? TextInputType.text,
//         decoration: InputDecoration(
//           errorText: widget.errorText,
//           helperText: widget.helperText,
//           focusedBorder: MyDecoration.focusedInputBorder,
//           enabledBorder: MyDecoration.enabledInputBorder,
//           counterText: "",
//         ),
//         style: MyTheme.typographyBlack.default1,
//         scrollPadding: EdgeInsets.only(bottom: Device.instance.screenHeight),
//         inputFormatters: widget.inputFormatters,
//         maxLength: widget.maxLength,
//       ),
//     );
// }
