import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/bag/bloc/bag_bloc.dart';
import 'package:xepa/app/helper/application_helper.dart';
import 'package:xepa/app/model/entity/bag_product.dart';
import 'package:xepa/app/widget/widgets.dart';

class Bag extends StatelessWidget {
  Bag({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        spacing,
        Padding(
          padding: const EdgeInsets.all(MySizes.mainHorizontalMargin),
          child: MyAppBar(
            showBackButton: true,
            hideBagButton: true,
            middleElement: Center(
              child: Text('Sacola', style: MyTheme.typographyBlack.headline4),
            ),
            color: MyColors.primaryColor,
          ),
        ),
        spacing,
        Expanded(
          child: BlocBuilder<BagBloc, BagState>(
            builder: (context, state) => Column(
              children: state.products
                  .map(
                    (e) => BagItem(product: e),
                  )
                  .toList(),
            ),
          ),
        ),
        const Summary(),
      ],
    );
  }
}

class BagItem extends StatelessWidget {
  const BagItem({Key? key, required this.product}) : super(key: key);

  final BagProduct product;

  final SizedBox spacing = const SizedBox(width: 10);

  @override
  Widget build(BuildContext context) => Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () => context.read<BagBloc>().add(BagProductRemoved(product))),
          children: [
            SlidableAction(
              onPressed: (context) => context.read<BagBloc>().add(BagProductRemoved(product)),
              backgroundColor: Colors.transparent,
              foregroundColor: MyColors.red,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: MySizes.mainHorizontalEdgeInsets,
          height: Device().screenHeight * .07,
          child: Row(
            children: [
              Expanded(
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
                              image: MyApplicationHelper.parseImg(product.imagem),
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
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.nome,
                            style: MyTheme.typographyBlack.default1,
                          ),
                          Text(
                            MyApplicationHelper.formatMoneyToBrWithPrefix(product.precoPromocional * product.quantidade),
                            style: MyTheme.typographyBlack.headline6.copyWith(color: MyColors.primaryColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              QuantityInput(
                initialValue: product.quantidade,
                onValueChanged: (value) => context.read<BagBloc>().add(BagProductQuantityChanged(product, value)),
              ),
            ],
          ),
        ),
      );
}

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: MySizes.mainHorizontalMargin, vertical: MySizes.mainVerticalMargin),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: MyColors.grey4,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resumo',
            style: MyTheme.typographyBlack.headline4.copyWith(fontWeight: FontWeight.w700),
          ),
          spacing,
          BlocBuilder<BagBloc, BagState>(
            builder: (context, state) => SummaryItem(
              label: 'Valor',
              value: MyApplicationHelper.formatMoneyToBrWithPrefix(state.total),
              iconData: Icons.monetization_on_outlined,
              valueStyle: MyTheme.typographyBlack.headline4.copyWith(color: MyColors.primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
          BlocBuilder<BagBloc, BagState>(
            builder: (context, state) => SummaryItem(
              label: 'Endereço para retirada',
              value: state.store == null
                  ? '-'
                  : '${state.store!.logradouro}, ${state.store!.numero} - ${state.store!.bairro}, ${state.store!.localidade} - ${state.store!.uf}',
              iconData: Icons.map_outlined,
            ),
          ),
          spacing,
          BlocBuilder<BagBloc, BagState>(
            builder: (context, state) => MyButton(
              label: 'Finalizar Pedido',
              child: state.fetchStatus == FetchStatus.loading ? const CircularProgressIndicator() : null,
              onTap: () {
                // if(![FetchStatus.loading, FetchStatus.success].contains(state.fetchStatus)) {
                  context.read<BagBloc>().add(BagOrderRequested());
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  const SummaryItem({Key? key, required this.label, required this.value, required this.iconData, this.valueStyle}) : super(key: key);

  final String label;
  final String value;
  final IconData iconData;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Icon(
              iconData,
              size: 30,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  label,
                  style: MyTheme.typographyBlack.label1,
                ),
                AutoSizeText(
                  value,
                  style: valueStyle ?? MyTheme.typographyBlack.headline5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
