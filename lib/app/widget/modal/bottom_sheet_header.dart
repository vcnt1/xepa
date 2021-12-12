import 'package:xepa/app/config/config.dart';
import 'package:flutter/material.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({Key? key, required this.title, this.subtitle}) : super(key: key);

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTheme.typographyBlack.headline2,
        ),
        subtitle == null
            ? const SizedBox()
            : Text(
                subtitle ?? '',
                style: MyTheme.typographyBlack.subtitle1,
              ),
      ],
    );
  }
}
