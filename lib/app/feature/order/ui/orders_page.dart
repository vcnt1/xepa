import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/login/ui/login_modal.dart';
import 'package:xepa/app/feature/order/bloc/order_bloc.dart';
import 'package:xepa/app/feature/session/bloc/session_bloc.dart';
import 'package:xepa/app/feature/signin/ui/signin_modal.dart';
import 'package:xepa/app/helper/application_helper.dart';
import 'package:xepa/app/model/entity/order.dart';
import 'package:xepa/app/repository/user_repository.dart';
import 'package:xepa/app/widget/widgets.dart';

import '../../../widget/app_bar.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

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
          child: BlocBuilder<SessionBloc, SessionState>(
            builder: (context, state) => state.status != SessionStatus.authenticated
                ? OrdersMissingAuthentication()
                : BlocProvider(
                    create: (context) => OrderBloc(userRepository: context.read<UserRepository>())..add(OrderFetchData()),
                    child: const SingleChildScrollView(
                      child: Body(),
                    ),
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
    return Column(
      children: const [
        OrdersList(),
      ],
    );
  }
}

class OrdersList extends StatelessWidget {
  const OrdersList({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: MySizes.mainHorizontalEdgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pedidos',
            style: MyTheme.typographyBlack.headline4.copyWith(fontWeight: FontWeight.w700),
          ),
          spacing,
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) => state.status == FetchStatus.loading
                ? const CircularProgressIndicator()
                : state.orders.isEmpty
                    ? const Text('No orders available')
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: state.orders.map((order) => OrderItem(order: order)).toList(),
                      ),
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);

  final Order order;

  final SizedBox spacing = const SizedBox(width: 10);
  final SizedBox verticalSpacing = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(MyRouter.orderDetailRoute, arguments: order.id),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.grey5, width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(MyApplicationHelper.phraseDateFormat(order.updatedAt) ?? ''),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: MyColors.primaryColor,
                  ),
                ],
              ),
              verticalSpacing,
              Row(
                children: [
                  Container(
                    width: Device().screenHeight * .05,
                    height: Device().screenHeight * .05,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: MyApplicationHelper.parseImg(order.estabelecimentos.imagem ?? ''),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  spacing,
                  Text(
                    order.estabelecimentos.nome ?? '',
                    style: MyTheme.typographyBlack.headline5,
                  )
                ],
              ),
              verticalSpacing,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: order.produtos
                    .map(
                      (e) => Text('${e.compraProduto.quantidade} ${e.nome}'),
                    )
                    .toList(),
              ),
              verticalSpacing,
              Text(
                '${toBeginningOfSentenceCase(order.statusUsuario)} - Nº ${order.id}',
                style: MyTheme.typographyBlack.headline6.copyWith(
                  color: MyColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      );
}

class OrdersMissingAuthentication extends StatelessWidget {
  OrdersMissingAuthentication({Key? key}) : super(key: key);

  SizedBox sectionSpacing = const SizedBox(height: 30);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MySizes.mainHorizontalMargin),
      child: Column(
        children: [
          const Text('Essa é uma área restrita aos clientes cadastrados.'),
          sectionSpacing,
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image:  DecorationImage(
                  image: AssetImage('assets/images/madsonHistoricoCriarCadastro.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          sectionSpacing,
          const Text('Não fique de fora, basta clicar no botão abaixo para se tornar um Xepeiro você também!'),
          sectionSpacing,
          MyButton(
            label: 'Faça login',
            onTap: () => showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              builder: (_) => const LoginModal(),
            ),
          ),
        ],
      ),
    );
  }
}
