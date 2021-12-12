// import 'package:xepa/app/config/config.dart';
// import 'package:flutter/material.dart';
//
// import 'widgets.dart';
//
// class MySliderSkeleton extends StatelessWidget {
//   MySliderSkeleton({Key? key, double width, double height}) : super(key: key){
//     this.width = width ?? double.infinity;
//     this.height = height ?? Device.instance.screenHeight * .1;
//   }
//
//   double width;
//   double height;
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       padding: EdgeInsets.zero,
//       itemCount: 10,
//       physics: NeverScrollableScrollPhysics(),
//       itemBuilder: (BuildContext context, int index) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Skeleton(
//           width: height,
//           height: height,
//         ),
//       ),
//     );
//   }
// }
