// import 'package:flutter/material.dart';
//
// class MyRadioList extends StatefulWidget {
//   const MyRadioList({Key? key, required this.items, required this.initialValue, required this.onTap}) : super(key: key);
//
//   final List<RadioItem> items;
//   final String initialValue;
//   final ValueChanged onTap;
//
//   @override
//   _MyRadioListState createState() => _MyRadioListState();
// }
//
// class _MyRadioListState extends State<MyRadioList> {
//   var _groupValue;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _groupValue = widget.initialValue;
//   }
//
//   @override
//   Widget build(BuildContext context) => ListView(
//       physics: BouncingScrollPhysics(),
//       shrinkWrap: true,
//       children: widget.items
//           .map(
//             (e) => RadioListTile(
//               value: e.value,
//               title: e.title,
//               subtitle: e.subtitle,
//               groupValue: _groupValue,
//               onChanged: (value){
//                 setState(() {
//                   _groupValue = value;
//                 });
//                 widget.onTap(e.value);
//               },
//               selected: e.value == _groupValue,
//             ),
//           ).toList(),
//     );
// }
//
// class RadioItem {
//   const RadioItem({this.value, this.title, this.subtitle});
//
//   final value;
//   final Widget title;
//   final Widget subtitle;
// }
