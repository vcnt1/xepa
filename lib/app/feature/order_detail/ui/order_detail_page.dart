import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/order_detail/bloc/order_detail_bloc.dart';
import 'package:xepa/app/helper/application_helper.dart';
import 'package:xepa/app/model/entity/order.dart';
import 'package:xepa/app/repository/user_repository.dart';
import 'package:xepa/app/widget/widgets.dart';

import '../../../widget/app_bar.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key, required this.orderId}) : super(key: key);

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailBloc(
        orderId: orderId,
        userRepository: context.read<UserRepository>(),
      )..add(
          OrderDetailFetchData(),
        ),
      child: Column(
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
              hideBagButton: true,
              color: MyColors.primaryColor,
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Body(),
            ),
          ),
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
      width: double.infinity,
      padding: MySizes.mainHorizontalEdgeInsets,
      child: BlocBuilder<OrderDetailBloc, OrderDetailState>(
        builder: (context, state) => state.status == FetchStatus.loading && state.order == null
            ? const Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: const [
                  StoreInfo(),
                  OrderInfo(),
                  StatusInfo(),
                ],
              ),
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
    return BlocBuilder<OrderDetailBloc, OrderDetailState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: Device().screenHeight * .05,
                height: Device().screenHeight * .05,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: MyApplicationHelper.parseImg(state.order?.estabelecimentos.imagem ?? ''),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              spacing,
              Text(
                state.order?.estabelecimentos.nome ?? '',
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
            '${state.order?.estabelecimentos.logradouro}, ${state.order?.estabelecimentos.numero} - ${state.order?.estabelecimentos.bairro}, ${state.order?.estabelecimentos.localidade} - ${state.order?.estabelecimentos.uf}',
            style: MyTheme.typographyBlack.headline5,
            maxLines: 2,
          ),
          verticalSpacing,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
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
                Text('${toBeginningOfSentenceCase(state.order?.statusEstabelecimento)} dia ${state.order?.updatedAt.day}'),
              ],
            ),
          ),
          verticalSpacing,
          Text(
            'Pedido Nº ${state.order?.id}',
            style: MyTheme.typographyBlack.headline5.copyWith(fontWeight: FontWeight.w700),
          ),
          verticalSpacing,
          ...?state.order?.produtos
              .map(
                (e) => productsItem(quantity: e.compraProduto.quantidade, name: e.nome, value: e.compraProduto.quantidade * e.precoPromocional),
              )
              .toList(),
          verticalSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total:', style: MyTheme.typographyBlack.headline5),
              Text(
                MyApplicationHelper.formatMoneyToBrWithPrefix(
                    state.order?.produtos.fold(0, (p, Produto c) => p! + (c.precoPromocional * c.compraProduto.quantidade)) ?? 0),
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
      ),
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
