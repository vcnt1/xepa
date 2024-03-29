import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:xepa/app/feature/bag/bloc/bag_bloc.dart';
import 'package:xepa/app/feature/navigation/ui/inner_page.dart';
import 'package:xepa/app/widget/my_logo.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({Key? key, this.showBackButton = false, this.color = Colors.white, this.middleElement, this.hideBagButton = false}) : super(key: key);

  final bool showBackButton;
  final Color color;
  final Widget? middleElement;
  final bool hideBagButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        showBackButton
            ? GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: color,
                  size: 30,
                ),
              )
            : GestureDetector(
                onTap: () {},
                child: MyLogo(
                  width: Device().screenWidth * .2,
                  color: MyColors.primaryColor,
                ),
              ),
        Expanded(child: middleElement ?? const SizedBox()),
        hideBagButton
            ? const Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Colors.transparent,
              )
            : GestureDetector(
                onTap: () => scaffoldKey.currentState?.openEndDrawer(),
                child: BlocBuilder<BagBloc, BagState>(
                  builder: (context, state) => Stack(
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 30,
                        color: color,
                      ),
                      state.products.isEmpty ? SizedBox() : Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
