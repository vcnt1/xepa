import 'package:flutter/material.dart';
import 'package:xepa/app/feature/home/ui/home_page.dart';
import 'package:xepa/app/feature/navigation/ui/inner_page.dart';
import 'package:xepa/app/feature/store/ui/store_page.dart';
import 'package:xepa/app/feature/welcome/welcome_page.dart';

class MyRouter {
  const MyRouter();

  static const String welcomeRoute = '/welcome';
  static const String innerRoute = '/inner';

  static get outter => (RouteSettings settings) {
    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => WelcomePage(),
        );
      case innerRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const InnerPage(),
        );
      default:
        return defaultRoute();
    }
  };

  static const String homeRoute = '/home';
  static const String storeRoute = '/store';

  static get inner => (RouteSettings settings) {
        switch (settings.name) {
          case homeRoute:
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => const HomePage(),
            );
          case storeRoute:
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => const StorePage(),
            );
          default:
            return defaultRoute();
        }
      };

  static MaterialPageRoute defaultRoute() => MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('No route defined'),
          ),
        ),
      );
}
