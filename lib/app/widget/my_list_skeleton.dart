// import 'package:xepa/app/widget/skeleton.dart';
// import 'package:xepa/app/config/config.dart';
// import 'package:flutter/material.dart';
//
// class MyListSkeleton extends StatelessWidget {
//   MyListSkeleton({Key? key, this.scrollDirection = Axis.vertical, this.width, this.height}) : super(key: key) {
//     padding = scrollDirection == Axis.vertical ? const EdgeInsets.symmetric(vertical: 10) : const EdgeInsets.symmetric(horizontal: 10);
//   }
//
//   final Axis scrollDirection;
//   final double? width;
//   final double? height;
//
//   EdgeInsets? padding;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       padding: EdgeInsets.zero,
//       itemCount: 10,
//       scrollDirection: scrollDirection,
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (BuildContext context, int index) => Container(
//         padding: padding,
//         child: Skeleton(
//           width: width ?? double.infinity,
//           height: height ?? Device.instance().screenHeight * .1,
//         ),
//       ),
//     );
//   }
// }
