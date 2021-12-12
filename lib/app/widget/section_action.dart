// import 'package:xepa/app/config/config.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
//
// import 'my_button.dart';
//
// class SectionAction extends StatelessWidget {
//   SectionAction({Key? key, required this.title, required this.onTap}) : super(key: key) {
//     typograpgy = MyTheme.typographyBlack;
//     button = MyButton.outlined(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Icon(Icons.keyboard_arrow_right_outlined),
//       ),
//     );
//   }
//
//   SectionAction.white({Key? key, required this.title, required this.onTap}) : super(key: key) {
//     typograpgy = MyTheme.typographyWhite;
//     button = MyButton(
//       onTap: onTap,
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Icon(Icons.keyboard_arrow_right_outlined),
//       ),
//     );
//   }
//
//   final String title;
//   final Function onTap;
//
//   MyText typograpgy;
//   MyButton button;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: AutoSizeText(
//               title,
//               style: typograpgy.headline3,
//               maxLines: 1,
//               minFontSize: 10,
//             ),
//           ),
//           button,
//         ],
//       ),
//     );
//   }
// }
