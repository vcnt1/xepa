import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/store/bloc/store_bloc.dart';
import 'package:xepa/app/helper/application_helper.dart';
import 'package:xepa/app/model/entity/product.dart';
import 'package:xepa/app/model/entity/store.dart';
import 'package:xepa/app/repository/store_repository.dart';
import 'package:xepa/app/widget/widgets.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreBloc(
        store: store,
        storeRepository: context.read<StoreRepository>(),
      )..add(StoreFetchProducts()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/bg-food.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
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
        BlocBuilder<StoreBloc, StoreState>(
          builder: (context, state) => Padding(
            padding: verticalMargin,
            child: Column(
              children: [
                Container(
                  width: Device().screenHeight * .08,
                  height: Device().screenHeight * .08,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: MyApplicationHelper.parseImg(state.store.imagem ?? ''),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                spacing,
                Text(state.store.nome ?? '', style: MyTheme.typographyWhite.headline5),
                Text(state.store.tipo ?? '', style: MyTheme.typographyWhite.headline6),
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
                                '${state.store.logradouro}, ${state.store.numero} - ${state.store.bairro}, ${state.store.localidade} - ${state.store.uf}',
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
      width: double.infinity,
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
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<StoreBloc, StoreState>(
                builder: (context, state) => state.status == FetchStatus.loading
                    ? const MyLoadingIndicator()
                    : state.products.isEmpty
                        ? Column(
                            children: [
                              const Text('No products available'),
                              MyButton(onTap: () => context.read<StoreBloc>().add(StoreFetchProducts()), label: 'Procurar novamente'),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: state.products.map((e) => ProductItem(product: e)).toList(),
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  final SizedBox spacing = const SizedBox(width: 10);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(MyRouter.productRoute, arguments: [product, context.read<StoreBloc>().state.store]),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          height: Device().screenHeight * .1,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Hero(
                  tag: 'product-image',
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: MyApplicationHelper.parseImg(product.imagem ?? ''),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
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
                      product.nome ?? '',
                      style: MyTheme.typographyBlack.headline5,
                    ),
                    Text(
                      product.tipo ?? '',
                      style: MyTheme.typographyBlack.headline6,
                    ),
                    Text(
                      product.descricao ?? '',
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
