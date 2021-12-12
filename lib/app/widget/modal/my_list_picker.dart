// import 'package:xepa/app/config/enums.dart';
// import 'package:xepa/app/widget/widgets.dart';
// import 'package:xepa/app/config/config.dart';
// import 'package:flutter/material.dart';
//
// class MyListPicker extends StatelessWidget {
//   const MyListPicker({Key? key, required this.title, required this.fetchStatus, required this.itemList, this.initalValue, required this.onChanged}) : super(key: key);
//
//   final String title;
//   final initalValue;
//   final ValueChanged onChanged;
//   final FetchStatus fetchStatus;
//   final List<ListPickerItem> itemList;
//
//   @override
//   Widget build(BuildContext context) => WillPopScope(
//         onWillPop: () {
//           Navigator.of(context).pop();
//           return Future.value(false);
//         },
//         child: BottomSheetContainer.custom(
//           navigatorState: Navigator.of(context),
//           children: [
//             const SizedBox(height: 30),
//             BottomSheetHeader(
//               title: title,
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: [FetchStatus.iddle, FetchStatus.success].contains(fetchStatus) && itemList.isNotEmpty
//                   ? MyRadioList(
//                       initialValue: initalValue,
//                       onTap: onChanged,
//                       items: itemList
//                           .map(
//                             (ListPickerItem e) => RadioItem(
//                                 value: e.value,
//                                 title: Text(
//                                   e.label,
//                                   style: MyTheme.typographyBlack.headline5,
//                                 ),
//                                 subtitle: e.description != null
//                                     ? Text(
//                                         e.description,
//                                         style: MyTheme.typographyBlack.headline6,
//                                       )
//                                     : null),
//                           )
//                           .toList(),
//                     )
//                   : MyRadioList(
//                       initialValue: '-1',
//                       items: List.generate(
//                         5,
//                         (i) => RadioItem(
//                           value: i.toString(),
//                           title: Container(
//                             width: MySizes.menuItemWidgth / 2,
//                             height: MySizes.menuItemHeight / 2,
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                             child: Skeleton(),
//                           ),
//                         ),
//                       ).toList(),
//                     ),
//             ),
//             InkWell(
//               onTap: () => Navigator.of(context).pop(),
//               child: Container(
//                 width: Device.instance().screenWidth,
//                 decoration: MyDecoration.topBorderBox,
//                 padding: const EdgeInsets.fromLTRB(MySizes.mainHorizontalMargin, 20, MySizes.mainHorizontalMargin, 0),
//                 child: Center(
//                   child: Text(
//                     'Fechar',
//                     style: MyTheme.typographyBlack.label1,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
// }
//
// class ListPickerItem {
//   ListPickerItem({required this.label, required this.description, this.value});
//
//   final String label;
//   final String description;
//   final value;
// }
