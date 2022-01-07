import 'package:xepa/app/config/config.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class QuantityInput extends StatefulWidget {
  const QuantityInput({Key? key, required this.onValueChanged, this.initialValue = 1, this.maxValue}) : super(key: key);

  final ValueChanged<int> onValueChanged;
  final int initialValue;
  final int? maxValue;

  @override
  _QuantityInputState createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  late int counter;

  @override
  void initState() {
    counter = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(
            label: '',
            onTap: () {
              setState(() => counter -= counter > 0 ? 1 : 0);
              widget.onValueChanged(counter);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: Device().screenWidth * .1,
            alignment: Alignment.center,
            child: Text(
              counter.toString(),
              style: MyTheme.typographyBlack.headline4,
            ),
          ),
          MyButton(
            label: '',
            onTap: () {
              setState(() => counter += counter == widget.maxValue ? 0 : 1);
              widget.onValueChanged(counter);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
