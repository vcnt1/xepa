import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/widget/widgets.dart';

import '../../../widget/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(MySizes.mainHorizontalMargin),
          child: MyAppBar(
            color: MyColors.primaryColor,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Body(),
          ),
        ),
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MenuCaroulsel(),
        spacing,
        const StoreList(),
      ],
    );
  }
}

class MenuCaroulsel extends StatelessWidget {
  const MenuCaroulsel({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(width: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Device().screenHeight * .2,
      padding: MySizes.mainHorizontalEdgeInsets,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          spacing,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StoreList extends StatelessWidget {
  const StoreList({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MySizes.mainHorizontalEdgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estabelecimentos',
            style: MyTheme.typographyBlack.headline4.copyWith(fontWeight: FontWeight.w700),
          ),
          spacing,
          const StoreItem(
            name: 'Duetto Restaurante & Pizzaria',
            type: 'Brasileira',
            status: 'Aberto',
            image: 'Image',
          ),
        ],
      ),
    );
  }
}

class StoreItem extends StatelessWidget {
  const StoreItem({Key? key, required this.name, required this.status, required this.type, required this.image}) : super(key: key);

  final String name;
  final String status;
  final String type;
  final String image;

  final SizedBox spacing = const SizedBox(width: 10);

  @override
  Widget build(BuildContext context) =>
      GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(MyRouter.storeRoute),
        child: Container(
          height: Device().screenHeight * .1,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/dueto-logo.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              spacing,
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: MyTheme.typographyBlack.headline5,
                    ),
                    Text(
                      type,
                      style: MyTheme.typographyBlack.headline6,
                    ),
                    Text(
                      status,
                      style: MyTheme.typographyBlack.default2.copyWith(color: MyColors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
