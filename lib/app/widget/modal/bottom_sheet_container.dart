import 'package:xepa/app/widget/modal/modal_top_decorator.dart';
import 'package:xepa/app/config/config.dart';
import 'package:flutter/material.dart';

class BottomSheetContainer extends StatelessWidget {
  BottomSheetContainer({Key? key, required this.children, required this.navigatorState, this.bottomWidget}) : super(key: key) {
    children.insert(0, const ModalTopDecorator());
    maxHeight = Device().screenHeight * .85;
  }

  BottomSheetContainer.custom({Key? key, required this.children, required this.navigatorState, this.bottomWidget}) : super(key: key) {
    maxHeight = Device().screenHeight * .7;
  }

  List<Widget> children;
  Widget? bottomWidget;
  NavigatorState navigatorState;

  late double maxHeight;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        navigatorState.pop();
        return Future.value(false);
      },
      child: Container(
        constraints: BoxConstraints(
          maxHeight: maxHeight,
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: bottomWidget == null ? 30 : MySizes.bottomWidgetHeightModal),
              margin: MySizes.mainHorizontalEdgeInsets,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
            Positioned(
              bottom: 0,
              child: bottomWidget ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
