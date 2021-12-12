// import 'package:xepa/app/config/config.dart';
// import 'package:flutter/material.dart';
//
// class MyRadioButton extends StatelessWidget {
//   MyRadioButton({Key? key, required this.value, required this.groupValue, required this.label, this.onValueChanged}) : super(key: key);
//
//   final value;
//   final groupValue;
//   final String label;
//   final ValueChanged onValueChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     bool isChecked = value == groupValue;
//     return InkWell(
//       onTap: () => onValueChanged(value),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 15),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: Device.instance.screenWidth * .15,
//               alignment: Alignment.center,
//               child: Container(
//                 width: Device.instance.screenWidth * .05,
//                 height: Device.instance.screenWidth * .05,
//                 padding: const EdgeInsets.all(2),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: isChecked ? MyColors.greenBlueish : MyColors.midGrey,
//                   ),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: isChecked ? MyColors.greenBlueish : Colors.transparent,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 label,
//                 style: MyTheme.typographyBlack.default1,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
