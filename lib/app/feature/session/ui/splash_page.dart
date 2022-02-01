import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/config/enums.dart';
import 'package:xepa/app/feature/login/ui/login_modal.dart';
import 'package:xepa/app/feature/navigation/ui/inner_page.dart';
import 'package:xepa/app/feature/session/bloc/session_bloc.dart';
import 'package:xepa/app/feature/signin/ui/signin_modal.dart';
import 'package:xepa/app/widget/widgets.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  SizedBox buttonSpacing = const SizedBox(height: 20);
  SizedBox sectionSpacing = const SizedBox(height: 30);

  bool once = true;

  @override
  Widget build(BuildContext context) {
    if (once) {
      context.read<SessionBloc>().add(SessionCheckStatus());
      once = false;
    }
    return BlocListener<SessionBloc, SessionState>(
      listener: (context, state) {
        if (innerNavigator.currentState == null) {
          switch (state.status) {
            case SessionStatus.authenticated:
              Navigator.of(context).pushReplacementNamed(MyRouter.innerRoute);
              break;
            case SessionStatus.unauthenticated:
              Navigator.of(context).pushReplacementNamed(MyRouter.welcomeRoute);
              break;
            case SessionStatus.unknown:
            case SessionStatus.initial:
              break;
          }
        }
      },
      child: Container(
        color: MyColors.primaryColor,
        height: Device().screenHeight,
        width: Device().screenWidth,
        child: Center(
          child: MyLogo(
            width: Device().screenWidth * .5,
          ),
        ),
      ),
    );
  }
}
