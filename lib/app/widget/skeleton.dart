// import 'package:xepa/app/config//colors.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// class Skeleton extends StatelessWidget {
//   Skeleton({Key? key, required this.width, required this.height}) : super(key: key){
//     this.highlight = MyColors.skeletonHighlightAlt;
//     this.base = MyColors.skeletonBaseAlt;
//   }
//
//   Skeleton.white({Key? key, required this.width, required this.height}) : super(key: key){
//     this.highlight = MyColors.skeletonHighlight;
//     this.base = MyColors.skeletonBase;
//   }
//
//   final double width;
//   final double height;
//
//   Color highlight;
//   Color base;
//
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       highlightColor: highlight,
//       baseColor: base,
//       child: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5.0),
//           color: base,
//         ),
//       ),
//     );
//   }
// }
//
