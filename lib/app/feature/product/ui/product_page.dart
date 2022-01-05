import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/bag/bloc/bag_barrel.dart';
import 'package:xepa/app/model/entity/product.dart';
import 'package:xepa/app/widget/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'product-image',
          child: Container(
            height: Device().screenHeight * .4,
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/images/lasanha.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Positioned(
          top: Device().screenHeight * .4 - 20,
          child: Body(),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 10);
  final SizedBox iconSpacing = const SizedBox(width: 5);

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      color: MyColors.primaryColor,
      showBackButton: true,
      middleElement: Column(
        children: [
          Text('Duettos Restaurante & Pizzaria', style: MyTheme.typographyBlack.headline5),
          Text('Brasileira', style: MyTheme.typographyBlack.headline6),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Device().screenWidth,
      height: Device().screenHeight * .6,
      padding: const EdgeInsets.symmetric(horizontal: MySizes.mainHorizontalMargin, vertical: MySizes.mainHorizontalMargin),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          CustomAppBar(),
          const Expanded(
            child: FoodDetail(),
          ),
          MyButton(
              onTap: () {},
              // onTap: () => BlocProvider.of<BagBloc>(context).add(
              //       BagAddProduct(),
              //     ),
              label: 'Adicionar'),
        ],
      ),
    );
  }
}

class FoodDetail extends StatelessWidget {
  const FoodDetail({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 10);
  final SizedBox horizontalSpacing = const SizedBox(width: 10);
  final SizedBox topMargin = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topMargin,
          Text(
            'Lasanha',
            style: MyTheme.typographyBlack.headline4.copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            '500g',
            style: MyTheme.typographyBlack.subtitle1,
          ),
          spacing,
          Text(
            'Contém: Molho de tomare, carne moída, queijo, presunto e molho branco.',
            style: MyTheme.typographyBlack.default2,
          ),
          spacing,
          Text(
            'Quantidade restante: 2',
            style: MyTheme.typographyBlack.headline6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuantityInput(
                onValueChanged: (value) => {},
              ),
              Row(
                children: [
                  Text(
                    'R\$ 20,00',
                    style: MyTheme.typographyBlack.headline6.copyWith(decoration: TextDecoration.lineThrough),
                  ),
                  horizontalSpacing,
                  Text(
                    'R\$ 10,00',
                    style: MyTheme.typographyBlack.headline2.copyWith(color: MyColors.primaryColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
