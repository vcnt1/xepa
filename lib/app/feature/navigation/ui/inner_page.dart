import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/session/bloc/session_barrel.dart';

import '../../bag/ui/bag.dart';
import 'inner_repositories.dart';
import 'inner_blocs.dart';

final GlobalKey<NavigatorState> innerNavigator = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class InnerPage extends StatelessWidget {
  const InnerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyRepositories(
      child: MyBlocs(
        child: BlocListener<SessionBloc, SessionState>(
          listener: (context, state) {},
          child: Scaffold(
            key: scaffoldKey,
            endDrawer: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              child: Drawer(
                child: Bag(),
              ),
            ),
            body: Container(
              width: Device().screenWidth,
              height: Device().screenHeight,
              color: MyColors.backgroundColor,
              child: Navigator(
                key: innerNavigator,
                onGenerateRoute: MyRouter.inner,
                initialRoute: MyRouter.homeRoute,
              ),
            ),
            bottomNavigationBar: const MyBottomNavigationBar(),
          ),
        ),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Pesquisar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Pedidos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: MyColors.primaryColor,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: MyColors.grey3,
      onTap: _onItemTapped,
    );
  }
}


