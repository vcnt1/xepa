import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/config/enums.dart';
import 'package:xepa/app/feature/login/ui/login_modal.dart';
import 'package:xepa/app/feature/navigation/ui/inner_page.dart';
import 'package:xepa/app/feature/session/bloc/session_bloc.dart';
import 'package:xepa/app/feature/signin/ui/signin_modal.dart';
import 'package:xepa/app/widget/widgets.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  SizedBox buttonSpacing = const SizedBox(height: 20);
  SizedBox sectionSpacing = const SizedBox(height: 30);

  @override
  Widget build(BuildContext context) => BlocListener<SessionBloc, SessionState>(
    listener: (context, state) {
      if(innerNavigator.currentState == null && state.status == SessionStatus.authenticated){
        Navigator.of(context).pushNamed(MyRouter.innerRoute);
      }
    },
    child: Container(
          height: Device().screenHeight,
          width: Device().screenWidth,
          decoration: BoxDecoration(
            color: MyColors.primaryColor,
            image: const DecorationImage(
              image: AssetImage('assets/images/welcome-madson.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Padding(
            padding: MySizes.alternativeEdgeInsets,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Comida barata',
                  style: MyTheme.typographyWhite.headline1.copyWith(fontWeight: FontWeight.w800),
                ),
                Text(
                  'é aqui!',
                  style: MyTheme.typographyWhite.headline1.copyWith(fontWeight: FontWeight.w800),
                ),
                sectionSpacing,
                MyButton.white(
                  label: 'Eu quero!',
                  onTap: () => Navigator.of(context).pushNamed(MyRouter.innerRoute),
                ),
                buttonSpacing,
                MyButton.outlined(
                  label: 'Faça parte',
                  onTap: () => showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => const SigninModal(),
                  ),
                ),
                buttonSpacing,
                MyButton.outlined(
                  label: 'Já sou xepeiro',
                  onTap: () => showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => const LoginModal(),
                  ),
                ),
                sectionSpacing,
                Center(
                  child: MyLogo(
                    width: Device().screenWidth * .2,
                  ),
                ),
              ],
            ),
          ),
        ),
  );
}
