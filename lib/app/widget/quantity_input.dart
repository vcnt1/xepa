// import 'package:xepa/app/config/config.dart';
// import 'package:flutter/material.dart';
//
// import 'widgets.dart';
//
// class QuantityInput extends StatefulWidget {
//   const QuantityInput({Key? key, this.onValueChanged}) : super(key: key);
//
//   final ValueChanged<int> onValueChanged;
//
//   @override
//   _QuantityInputState createState() => _QuantityInputState();
// }
//
// class _QuantityInputState extends State<QuantityInput> {
//   int counter = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           MyButton.outlined(
//             onTap: () {
//               setState(() => counter -= counter > 0 ? 1 : 0);
//               widget.onValueChanged(counter);
//             },
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               child: Icon(Icons.add),
//             ),
//           ),
//           Container(
//             width: Device.instance.screenWidth * .3,
//             alignment: Alignment.center,
//             child: Text(
//               counter.toString(),
//               style: MyTheme.typographyBlack.headline4,
//             ),
//           ),
//           MyButton.outlined(
//             onTap: () {
//               setState(() => counter += 1);
//               widget.onValueChanged(counter);
//             },
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               child: Icon(Icons.add),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
