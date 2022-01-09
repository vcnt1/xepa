import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/home/bloc/home_bloc.dart';
import 'package:xepa/app/model/entity/order.dart';
import 'package:xepa/app/widget/widgets.dart';

import '../../../widget/app_bar.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

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
    return Column(
      children: [
        const OrdersList(),
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
          OrderItem(
            order: Order(),
          )
          // BlocBuilder<HomeBloc, HomeState>(
          //   builder: (context, state) => state.status == FetchStatus.loading
          //       ? const CircularProgressIndicator()
          //       : state.stores.isEmpty
          //       ? const Text('No stores available')
          //       : Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: state.stores
          //         .map((store) => StoreItem(store: store))
          //         .toList(),
          //   ),
          // ),
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
        onTap: () => Navigator.of(context).pushNamed(MyRouter.orderDetailRoute),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.grey5, width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Terça, 07 de dezembro de 2021'),
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
              const Text('1 lasanha'),
              verticalSpacing,
              Text(
                'Pedido em andamento - Nº 12312341',
                style: MyTheme.typographyBlack.headline6.copyWith(
                  color: MyColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      );
}
