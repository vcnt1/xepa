import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/home/bloc/home_bloc.dart';
import 'package:xepa/app/feature/navigation/ui/outter_page.dart';
import 'package:xepa/app/feature/session/bloc/session_bloc.dart';
import 'package:xepa/app/feature/session/ui/splash_page.dart';
import 'package:xepa/app/widget/widgets.dart';

import '../../../widget/app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
          child: Body(),
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
    return Center(
      child: SizedBox(
        width: Device().screenWidth * .5,
        child: BlocListener<SessionBloc, SessionState>(
          listener: (context, state){
            if(state.status == SessionStatus.initial){
              outterNavigator.currentState!.pushAndRemoveUntil(MaterialPageRoute(
                builder: (_) => SplashPage(),
              ), (route) => false);
            }
          },
          child: MyButton(
            onTap: () {
              context.read<SessionBloc>().add(SessionLogoutRequested());
            },
            label: 'Sair',
          ),
        ),
      ),
    );
  }
}
