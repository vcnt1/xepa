import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/signin/bloc/signin_bloc.dart';
import 'package:xepa/app/repository/user_repository.dart';
import 'package:xepa/app/widget/widgets.dart';
import 'package:flutter/material.dart';

class SigninModal extends StatelessWidget {
  const SigninModal({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 30);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SigninBloc(
          userRepository: context.read<UserRepository>(),
        ),
        child: WillPopScope(
          onWillPop: () {
            Navigator.of(context).pop();
            return Future.value(false);
          },
          child: BottomSheetContainer(
            navigatorState: Navigator.of(context),
            children: [
              Center(
                child: Text(
                  'Criar cadastro',
                  style: MyTheme.typographyBlack.headline1,
                ),
              ),
              spacing,
              BlocBuilder<SigninBloc, SigninState>(
                buildWhen: (previous, current) => previous.name != current.name,
                builder: (context, state) => MyTextField(
                  errorText: state.name.invalid ? 'Nome inválida' : null,
                  labelText: 'Nome',
                  key: const Key('nome_input_signin'),
                  onChanged: (name) => context.read<SigninBloc>().add(
                        SigninNameChanged(name),
                      ),
                ),
              ),
              spacing,
              BlocBuilder<SigninBloc, SigninState>(
                buildWhen: (previous, current) => previous.email != current.email,
                builder: (context, state) => MyTextField(
                  errorText: state.email.invalid ? 'Email inválido' : null,
                  labelText: 'EMAIL',
                  key: const Key('email_input_signin'),
                  onChanged: (email) => context.read<SigninBloc>().add(
                        SigninEmailChanged(email),
                      ),
                ),
              ),
              spacing,
              BlocBuilder<SigninBloc, SigninState>(
                buildWhen: (previous, current) => previous.password != current.password,
                builder: (context, state) => MyTextField(
                  errorText: state.password.invalid ? 'Senha inválida' : null,
                  labelText: 'SENHA',
                  key: const Key('password_input_signin'),
                  onChanged: (password) => context.read<SigninBloc>().add(
                        SigninPasswordChanged(password),
                      ),
                ),
              ),
              spacing,
              BlocBuilder<SigninBloc, SigninState>(
                builder: (context, state) => MyButton(
                  label: 'Confirmar',
                  child: state.status.isSubmissionInProgress ? const CircularProgressIndicator() : null,
                  onTap: () {
                    if(state.status.isValidated) {
                      context.read<SigninBloc>().add(SigninSubmitted());
                    }
                  },
                ),
              ),
              spacing,
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              //TODO: REDEFINIR FEATURE
            ],
          ),
        ),
      );
}
