import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/session/bloc/session_barrel.dart';

import 'inner_repositories.dart';
import 'inner_blocs.dart';

final GlobalKey<NavigatorState> innerNavigator = GlobalKey<NavigatorState>();

class InnerPage extends StatelessWidget {
  const InnerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyRepositories(
      child: MyBlocs(
        child: BlocListener<SessionBloc, SessionState>(
          listener: (context, state) {},
          child: Container(
            width: Device().screenWidth,
            height: Device().screenHeight,
            color: MyColors.backgroundColor,
            child: Navigator(
              key: innerNavigator,
              onGenerateRoute: MyRouter.inner,
              initialRoute: MyRouter.homeRoute,
            ),
          ),
        ),
      ),
    );
  }
}
