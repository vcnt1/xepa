// import 'package:xepa/app/helper/application_helper.dart';
// import 'package:xepa/app/config/config.dart';
// import 'package:flutter/material.dart';
//
// class MyToggleButton extends StatelessWidget {
//   MyToggleButton({Key? key, required this.itens, required this.selectedItem, required this.onTap}) : super(key: key);
//
//   final List<String> itens;
//   final String selectedItem;
//   final Function(String value) onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     int itensPerRow = itens.length > 3 ? 3 : itens.length;
//     return Container(
//       decoration: MyDecoration.defaultInput,
//       child: Wrap(
//         children: itens
//             .map(
//               (e) => InkWell(
//                 onTap: () {
//                   onTap(e);
//                   MyApplicationHelper.unfocus(context);
//                 },
//                 child: Container(
//                   width: (Device.instance.screenWidth - (MySizes.mainHorizontalMargin * 2) - (itensPerRow * 11)) * 1/itensPerRow,
//                   height: 40,
//                   margin: const EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                     color: e == selectedItem ? MyColors.greenBlueish : Colors.transparent,
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                   child: Center(
//                     child: Text(
//                       e,
//                       style: e == selectedItem ? MyTheme.typographyWhite.default1 : MyTheme.typographyBlack.default1,
//                     ),
//                   ),
//                 ),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }
