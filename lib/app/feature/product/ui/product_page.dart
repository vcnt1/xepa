import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/bag/bloc/bag_bloc.dart';
import 'package:xepa/app/feature/product/bloc/product_bloc.dart';
import 'package:xepa/app/feature/store/bloc/store_bloc.dart';
import 'package:xepa/app/helper/application_helper.dart';
import 'package:xepa/app/model/entity/product.dart';
import 'package:xepa/app/model/entity/store.dart';
import 'package:xepa/app/widget/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.product, required this.store}) : super(key: key);

  final Product product;
  final Store store;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(store: store, product: product),
      child: Stack(
        children: [
          Hero(
            tag: 'product-image',
            child: Container(
              height: Device().screenHeight * .4,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: MyApplicationHelper.parseImg(product.imagem ?? ''),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: Device().screenHeight * .4 - 20,
            child: Body(),
          ),
        ],
      ),
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
      middleElement: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) => Column(
          children: [
            Text(state.store.nome ?? '', style: MyTheme.typographyBlack.headline5),
            Text(state.store.tipo ?? '', style: MyTheme.typographyBlack.headline6),
          ],
        ),
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
            label: 'Adicionar',
            onTap: () {
              if (context.read<ProductBloc>().state.selectedQuantity > 0) {
                BlocProvider.of<BagBloc>(context).add(
                  BagAddProduct(context.read<ProductBloc>().state.product, context.read<ProductBloc>().state.selectedQuantity),
                );
              }
            },
          ),
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
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topMargin,
          Text(
            state.product.nome ?? '',
            style: MyTheme.typographyBlack.headline4.copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            '${state.product.peso}g',
            style: MyTheme.typographyBlack.subtitle1,
          ),
          spacing,
          Text(
            state.product.descricao ?? '',
            style: MyTheme.typographyBlack.default2,
          ),
          spacing,
          Text(
            'Quantidade restante: ${state.product.quantidade}',
            style: MyTheme.typographyBlack.headline6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuantityInput(
                onValueChanged: (value) => context.read<ProductBloc>().add(ProductSelectedQuantityChanged(value)),
                maxValue: state.product.quantidade,
              ),
              Row(
                children: [
                  Text(
                    MyApplicationHelper.formatMoneyToBrWithPrefix(state.product.precoOriginal ?? 0),
                    style: MyTheme.typographyBlack.headline6.copyWith(decoration: TextDecoration.lineThrough),
                  ),
                  horizontalSpacing,
                  Text(
                    MyApplicationHelper.formatMoneyToBrWithPrefix(state.product.precoPromocional ?? 0),
                    style: MyTheme.typographyBlack.headline2.copyWith(color: MyColors.primaryColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
