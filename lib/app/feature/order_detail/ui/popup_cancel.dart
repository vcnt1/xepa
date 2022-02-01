import 'package:flutter/material.dart';
import 'package:xepa/app/config/device.dart';
import 'package:xepa/app/config/theme.dart';
import 'package:xepa/app/feature/login/ui/login_modal.dart';
import 'package:xepa/app/feature/order_detail/bloc/order_detail_bloc.dart';
import 'package:xepa/app/widget/my_button.dart';

class PopUpCancel extends StatelessWidget {
  const PopUpCancel({Key? key, required this.orderDetailBloc}) : super(key: key);

  final OrderDetailBloc orderDetailBloc;

  static const SizedBox spacing = SizedBox(height: 10);
  static const SizedBox horizontalSpacing = SizedBox(width: 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Device().screenHeight * .6,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage('assets/images/madsonCancelarPedido.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Center(
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
              const SizedBox(height: 5),
              Text(
                'Você só poderá cancelar outro pedido após 48 horas.',
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
                        orderDetailBloc.add(OrderCancelRequested());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
