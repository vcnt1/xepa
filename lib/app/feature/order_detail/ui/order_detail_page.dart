import 'package:auto_size_text/auto_size_text.dart';
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
                children: [
                  const StoreInfo(),
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
                Expanded(child: AutoSizeText('${toBeginningOfSentenceCase(state.order?.statusUsuario)} dia ${state.order?.updatedAt.day}')),
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

class StatusInfo extends StatelessWidget {
  StatusInfo({Key? key}) : super(key: key);

  static const String statusAguardandoRestaurante = "Aguardando restaurante aceitar pedido";
  static const String statusRestaurantePreparando = "Restaurante preparando seu pedido";
  static const String statusPedidoPronto = "Pedido Pronto";
  static const String statusPedidoRetirado = "Pedido Retirado";
  static const String statusRestauranteCancelou = "Restaurante Cancelou pedido";
  static const String statusEsperandoRestaurante = "Esperando restaurante cancelar pedido";
  static const String statusPedidoCancelado = "Pedido Cancelado";

  List<String> buildStatusTree(String currentStatus) {
    bool c = false;
    List<String> items = [];

    switch (currentStatus) {
      case statusAguardandoRestaurante:
      case statusRestaurantePreparando:
      case statusPedidoPronto:
      case statusPedidoRetirado:
        for (String e in [statusAguardandoRestaurante, statusRestaurantePreparando, statusPedidoPronto, statusPedidoRetirado]) {
          if (!c) {
            c = e == currentStatus;
            items.add(e);
          }
        }
        break;
      case statusRestauranteCancelou:
        return [statusAguardandoRestaurante, statusRestauranteCancelou];
      case statusEsperandoRestaurante:
      case statusPedidoCancelado:
        for (String e in [statusAguardandoRestaurante, statusEsperandoRestaurante, statusPedidoCancelado]) {
          if (!c) {
            c = e == currentStatus;
            items.add(e);
          }
        }
        break;
    }

    return items;
  }

  String getStatusTitle(String currentStatus) {
    switch (currentStatus) {
      case statusAguardandoRestaurante:
        return "Aguardando restaurante";
      case statusRestaurantePreparando:
        return "Pedido em preparo";
      case statusPedidoPronto:
        return "Pedido pronto para retirada";
      case statusPedidoRetirado:
        return "Pedido retirado";
      case statusEsperandoRestaurante:
        return "Enviado pedido de cancelamento";
      case statusRestauranteCancelou:
      case statusPedidoCancelado:
        return "Pedido cancelado";
    }

    return "Unknown status";
  }

  IconData getStatusIcon(String currentStatus) {
    switch (currentStatus) {
      case statusAguardandoRestaurante:
        return Icons.password;
      case statusRestaurantePreparando:
        return Icons.password;
      case statusPedidoPronto:
        return Icons.password;
      case statusPedidoRetirado:
        return Icons.password;
      case statusEsperandoRestaurante:
        return Icons.password;
      case statusRestauranteCancelou:
      case statusPedidoCancelado:
        return Icons.password;
    }

    return Icons.password;
  }

  final SizedBox verticalSpacing = const SizedBox(height: 10);
  final SizedBox horizontalSpacing = const SizedBox(width: 10);

  static final double size = Device().screenWidth * .1;

  Widget dots() => SizedBox(
        width: size,
        height: size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            dot(),
            dot(),
            dot(),
          ],
        ),
      );

  Widget dot() => Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          color: MyColors.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailBloc, OrderDetailState>(
      builder: (context, state) => state.order == null
          ? const SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing,
                verticalSpacing,
                Text(
                  "Status do pedido",
                  style: MyTheme.typographyWhite.headline5.copyWith(
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpacing,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buildStatusTree(state.order!.statusUsuario)
                      .map(
                        (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: size,
                                  height: size,
                                  child: Icon(
                                    getStatusIcon(e),
                                  ),
                                ),
                                horizontalSpacing,
                                Text(
                                  getStatusTitle(e),
                                ),
                              ],
                            ),
                            e == state.order!.statusUsuario ? const SizedBox(height: 20) : dots(),
                          ],
                        ),
                      )
                      .toList(),
                ),
                state.order!.statusUsuario == statusPedidoRetirado
                    ? const SizedBox()
                    : state.order!.statusUsuario == statusPedidoPronto
                        ? Row(
                            children: [
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: MyButton.white(
                                  onTap: () {},
                                  label: 'Cancelar',
                                ),
                              ),
                              horizontalSpacing,
                              Flexible(
                                flex: 4,
                                fit: FlexFit.tight,
                                child: MyButton(
                                  onTap: () {},
                                  label: 'Confirmar retirada',
                                ),
                              )
                            ],
                          )
                        : Container(
                          child: MyButton.white(
                            onTap: () {},
                            label: 'Cancelar',
                          ),
                        )
              ],
            ),
    );
  }
}
