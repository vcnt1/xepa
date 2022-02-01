import 'package:flutter/material.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/order_detail/bloc/order_detail_bloc.dart';
import 'package:xepa/app/widget/my_button.dart';

class PopUpConfirm extends StatelessWidget {
  const PopUpConfirm({Key? key, required this.orderDetailBloc}) : super(key: key);

  final OrderDetailBloc orderDetailBloc;

  static const SizedBox spacing = SizedBox(height: 10);
  static const SizedBox horizontalSpacing = SizedBox(width: 10);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tem certeza ?',
              style: MyTheme.typographyBlack.headline5,
            ),
            Text(
              'Confirme apenas se já houver retirado o pedido.',
              style: MyTheme.typographyBlack.label1,
            ),
            spacing,
            Row(
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: MyButton.white(
                    onTap: () => Navigator.of(context).pop(),
                    label: 'Não',
                  ),
                ),
                horizontalSpacing,
                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: MyButton(
                    label: 'Sim',
                    onTap: () {
                      Navigator.of(context).pop();
                      orderDetailBloc.add(OrderConfirmTakeAway());
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
