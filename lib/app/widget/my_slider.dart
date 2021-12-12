// import 'package:xepa/app/config/config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
//
// class MySlider extends StatefulWidget {
//   MySlider({
//     Key key,
//     required this.items,
//     this.selectedItem,
//     this.onChange,
//     this.itemExtent = 0,
//     this.leftMargin = 20,
//   }) : super(key: key);
//
//   final List<Widget> items;
//   final int selectedItem;
//   final double itemExtent;
//   final double leftMargin;
//   final ValueChanged<int> onChange;
//
//   @override
//   _MySliderState createState() => _MySliderState();
// }
//
// class _MySliderState extends State<MySlider> {
//   final ScrollController _controller = ScrollController();
//
//   void scheduleAnimationToSelectedItem() {
//     double selectedItemPosition = 0;
//     if (widget.selectedItem > 0 && widget.itemExtent > 0) {
//       selectedItemPosition = (Device.instance.screenWidth * .5) + (widget.itemExtent * (widget.selectedItem - 1));
//     }
//
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       _controller.animateTo(selectedItemPosition, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> _items = List<Widget>.from(
//       widget.items
//           .asMap()
//           .map(
//             (i, e) => MapEntry(
//               i,
//               widget.selectedItem == i
//                   ? e
//                   : InkWell(
//                       onTap: () => widget.onChange(i),
//                       child: e,
//                     ),
//             ),
//           )
//           .values
//           .toList(),
//     )..insert(0, SizedBox(width: widget.leftMargin));
//
//     scheduleAnimationToSelectedItem();
//
//     return NotificationListener<ScrollEndNotification>(
//       onNotification: (_) {
//         if(widget.onChange != null){
//           final int newSelectedItem = (_controller.position.pixels / widget.itemExtent).round();
//           if (widget.selectedItem != newSelectedItem) {
//             widget.onChange(newSelectedItem);
//           }
//         }
//         return true;
//       },
//       child: ListView(
//         controller: _controller,
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         padding: EdgeInsets.zero,
//         children: _items,
//       ),
//     );
//   }
// }
