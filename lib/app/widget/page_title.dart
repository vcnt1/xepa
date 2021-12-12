import 'package:xepa/app/config//theme.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  PageTitle({Key? key, required this.title}) : super(key: key);

  PageTitle.custom({Key? key, required this.title, required this.subtitle}) : super(key: key);

  final String title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyTheme.typographyBlack.headline1,
          ),
          subtitle != null
              ? Text(
                  subtitle ?? '',
                  style: MyTheme.typographyBlack.headline5.copyWith(fontWeight: FontWeight.w600),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
