import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/home/bloc/home_bloc.dart';
import 'package:xepa/app/helper/application_helper.dart';
import 'package:xepa/app/model/entity/order.dart';
import 'package:xepa/app/widget/widgets.dart';

import '../../../widget/app_bar.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeFetchData());
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(MySizes.mainHorizontalMargin),
          child: MyAppBar(
            middleElement: Center(
              child: Text(
                'Detalhes do pedido',
                style: MyTheme.typographyBlack.headline5,
              ),
            ),
            showBackButton: true,
            color: MyColors.primaryColor,
          ),
        ),
        const Expanded(
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
    return Container(
      width: double.infinity,
      padding: MySizes.mainHorizontalEdgeInsets,
      child: Column(
        children: const [
          StoreInfo(),
          OrderInfo(),
          StatusInfo(),
        ],
      ),
    );
  }
}

class StoreInfo extends StatelessWidget {
  const StoreInfo({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(width: 10);
  final SizedBox verticalSpacing = const SizedBox(height: 20);
  final SizedBox verticalSpacing2 = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: Device().screenHeight * .05,
              height: Device().screenHeight * .05,
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
            Text(
              'Duetto Pizzaria',
              style: MyTheme.typographyBlack.headline5,
            )
          ],
        ),
        verticalSpacing,
        Text(
          'Endereço para retirada',
          style: MyTheme.typographyBlack.label1,
        ),
        Text(
          // '${state.store.logradouro}, ${state.store.numero} - ${state.store.bairro}, ${state.store.localidade} - ${state.store.uf}',
          'Rua Porto alegre, 1227, Henrique Jorge - Fortaleza Ce',
          style: MyTheme.typographyBlack.headline5,
          maxLines: 2,
        ),
        verticalSpacing,
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: MyColors.grey5,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: MyColors.primaryColor,
              ),
              spacing,
              const Text('Pedido concluído dia 10'),
            ],
          ),
        ),
        verticalSpacing,
        Text(
          'Pedido Nº 123141245',
          style: MyTheme.typographyBlack.headline5.copyWith(fontWeight: FontWeight.w700),
        ),
        verticalSpacing,
        productsItem(quantity: 2, name: 'Lasanha', value: 2 * 7),
        productsItem(quantity: 2, name: 'Lasanha', value: 2 * 7),
        verticalSpacing,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total:', style: MyTheme.typographyBlack.headline5),
            Text(
              MyApplicationHelper.formatMoneyToBrWithPrefix(20),
              style: MyTheme.typographyBlack.headline5,
            ),
          ],
        ),
        verticalSpacing,
        Divider(
          height: 1,
          thickness: 1,
          color: MyColors.grey4,
        ),
      ],
    );
  }

  Widget productsItem({
    required int quantity,
    required String name,
    required double value,
  }) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('${quantity}x'),
                spacing,
                Text(name),
              ],
            ),
            Text(
              MyApplicationHelper.formatMoneyToBrWithPrefix(value),
            ),
          ],
        ),
      );
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class StatusInfo extends StatelessWidget {
  const StatusInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
