import 'package:xepa/app/feature/session/bloc/session_bloc.dart';
import 'package:xepa/app/repository/user_repository.dart';
import 'package:xepa/app/widget/keyboard_dismissible.dart';
import 'package:xepa/app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

final GlobalKey<NavigatorState> outterNavigator = GlobalKey<NavigatorState>();

class OutterPage extends StatelessWidget {
  OutterPage({Key? key}) : super(key: key);

  void _loadConfigs(BuildContext context) {
    Device().loadValues(MediaQuery.of(context));
    Intl.defaultLocale = 'pt_BR';
  }

  @override
  Widget build(BuildContext context) {
    _loadConfigs(context);
    return RepositoryProvider<UserRepository>(
      create: (context) => UserRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SessionBloc>(
            create: (context) => SessionBloc(
              userRepository: context.read<UserRepository>(),
            ),
          ),
        ],
        child: Material(
          color: MyColors.grey5,
          child: LayoutBuilder(
            builder: (ctx, constrains) => KeyboardDismissable(
              child: SizedBox(
                width: constrains.maxWidth,
                height: constrains.maxHeight,
                child: Navigator(
                  key: outterNavigator,
                  onGenerateRoute: MyRouter.outter,
                  initialRoute: MyRouter.splashRoute,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
