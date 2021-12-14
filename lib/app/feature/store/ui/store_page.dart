import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/widget/widgets.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/images/bg-food.png'),
          fit: BoxFit.cover,
          opacity: .3,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          const Expanded(
            child: Body(),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key}) : super(key: key);

  final EdgeInsets verticalMargin = const EdgeInsets.symmetric(vertical: 20);
  final SizedBox spacing = const SizedBox(height: 10);
  final SizedBox iconSpacing = const SizedBox(width: 5);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(MySizes.mainHorizontalMargin),
          child: MyAppBar(
            color: MyColors.primaryColor,
            showBackButton: true,
          ),
        ),
        Padding(
          padding: verticalMargin,
          child: Column(
            children: [
              Container(
                width: Device().screenHeight * .08,
                height: Device().screenHeight * .08,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage('assets/images/dueto-logo.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              spacing,
              Text('Duettos Restaurante & Pizzaria', style: MyTheme.typographyWhite.headline5),
              Text('Brasileira', style: MyTheme.typographyWhite.headline6),
              spacing,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag, color: MyColors.primaryColor),
                  iconSpacing,
                  Icon(Icons.shopping_bag, color: MyColors.primaryColor),
                  iconSpacing,
                  Icon(Icons.shopping_bag, color: MyColors.primaryColor),
                  iconSpacing,
                  Icon(Icons.shopping_bag_outlined, color: MyColors.grey4),
                  iconSpacing,
                  Icon(Icons.shopping_bag_outlined, color: MyColors.grey4),
                ],
              ),
              spacing,
              Container(
                width: Device().screenWidth - (MySizes.mainHorizontalMargin * 2),
                height: Device().screenHeight * .12,
                padding: const EdgeInsets.all(MySizes.mainHorizontalMargin),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Endereço para retirada',
                            style: MyTheme.typographyBlack.label1,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              'Rua Porto Alegre, 1227 - Henrique Jorge, Fortalze CEaaaaaaa',
                              style: MyTheme.typographyBlack.headline5,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    iconSpacing,
                    Icon(
                      Icons.map_outlined,
                      color: MyColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
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
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: const FoodList(),
    );
  }
}

class FoodList extends StatelessWidget {
  const FoodList({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 20);
  final SizedBox topMargin = const SizedBox(height: 30);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MySizes.mainHorizontalEdgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topMargin,
          Text(
            'Dísponível na xepa de hoje',
            style: MyTheme.typographyBlack.headline4.copyWith(fontWeight: FontWeight.w700),
          ),
          spacing,
          const FoodItem(
            name: 'Lasanha',
            type: 'Muito boa.',
            status: '500g',
            image: 'Image',
          ),
        ],
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  const FoodItem({Key? key, required this.name, required this.status, required this.type, required this.image}) : super(key: key);

  final String name;
  final String status;
  final String type;
  final String image;

  final SizedBox spacing = const SizedBox(width: 10);

  @override
  Widget build(BuildContext context) =>
      GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(MyRouter.productRoute),
        child: Container(
          height: Device().screenHeight * .1,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Hero(
                  tag: 'product-image',
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/lasanha.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
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
