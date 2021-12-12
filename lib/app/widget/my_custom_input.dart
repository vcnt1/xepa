import 'package:xepa/app/config/config.dart';
import 'package:flutter/material.dart';

class MyCustomInput extends StatelessWidget {
  const MyCustomInput({Key? key, required this.value, required this.onTap}) : super(key: key);

  final String value;
  final Function onTap;

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: () => onTap,
      child: Container(
        height: 50,
        decoration: MyDecoration.defaultInput,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value,
                  style: MyTheme.typographyBlack.default1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: MyColors.grey2,
              ),
            ],
          ),
        ),
      ),
    );
}
