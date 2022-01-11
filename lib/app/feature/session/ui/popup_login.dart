import 'package:flutter/material.dart';
import 'package:xepa/app/config/device.dart';
import 'package:xepa/app/feature/login/ui/login_modal.dart';
import 'package:xepa/app/widget/my_button.dart';

class PopUpLogin extends StatelessWidget {
  const PopUpLogin({Key? key}) : super(key: key);

  static const SizedBox spacing = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Device().screenHeight * .6,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage('assets/images/madsonCriarCadastroSacola.png'),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Para finalizar o seu pedido é necessário realizar o seu cadastro para identificação.',
              ),
              spacing,
              MyButton(
                label: 'Fazer login',
                onTap: () {
                  Navigator.of(context).pop();
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => const LoginModal(),
                  );
                },
              ),
              spacing,
              MyButton.white(onTap: () => Navigator.of(context).pop(), label: 'Continuar navegando'),
            ],
          ),
        ),
      ),
    );
  }
}
