import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/login/bloc/login_bloc.dart';
import 'package:xepa/app/widget/widgets.dart';
import 'package:flutter/material.dart';

class LoginModal extends StatelessWidget {
  const LoginModal({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 30);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => LoginBloc(),
        child: WillPopScope(
          onWillPop: () {
            Navigator.of(context).pop();
            return Future.value(false);
          },
          child: BottomSheetContainer(
            navigatorState: Navigator.of(context),
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'Acesso',
                      style: MyTheme.typographyBlack.headline1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Entre com suas credenciais abaixo',
                      style: MyTheme.typographyBlack.headline5.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              spacing,
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) => previous.email != current.email,
                builder: (context, state) => MyTextField(
                  errorText: state.email.invalid ? 'Email inválido' : null,
                  labelText: 'EMAIL',
                  key: const Key('email_input_login'),
                  onChanged: (email) => context.read<LoginBloc>().add(
                        LoginEmailChanged(email),
                      ),
                ),
              ),
              spacing,
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) => previous.password != current.password,
                builder: (context, state) => MyTextField(
                  errorText: state.password.invalid ? 'Senha inválida' : null,
                  labelText: 'SENHA',
                  key: const Key('password_input_login'),
                  onChanged: (password) => context.read<LoginBloc>().add(
                        LoginPasswordChanged(password),
                      ),
                ),
              ),
              spacing,
              MyButton(
                label: 'Entrar',
                onTap: () => Navigator.of(context).pushNamed(MyRouter.innerRoute),
              ),
              spacing,
              //TODO: REDEFINIR FEATURE
            ],
          ),
        ),
      );
}
