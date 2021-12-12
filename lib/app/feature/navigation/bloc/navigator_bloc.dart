// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
//
// import 'navigator_barrel.dart';
//
// class NavigatorBloc extends Bloc<NavigatorEvent, MyNavigatorState> {
//   NavigatorBloc({this.navigatorKey, this.routes, initialRoute}) : super(MyNavigatorState(currentRoute: initialRoute)) {
//     routeStack.add(initialRoute);
//   }
//
//   final GlobalKey<NavigatorState> navigatorKey;
//   final List routes;
//
//   List<String> routeStack = [];
//
//   int getCurrentRouteIndex() => routes.indexOf(state.currentRoute);
//
//   @override
//   Stream<MyNavigatorState> mapEventToState(
//     NavigatorEvent event,
//   ) async* {
//     if (event is NavigatorPushNamedRoute) {
//       yield _mapNavigatorPushNamedRouteToState(event, state);
//     } else if (event is NavigatorNextRoute) {
//       yield _mapNavigatorNextRouteToState(event, state);
//     } else if (event is NavigatorPopRoute) {
//       yield _mapNavigatorPopRouteToState(event, state);
//     }
//   }
//
//   MyNavigatorState _mapNavigatorPushNamedRouteToState(
//       NavigatorPushNamedRoute event,
//       MyNavigatorState state,
//   ){
//     final route = event.route;
//     navigatorKey.currentState.pushNamed(route);
//     routeStack.add(route);
//
//     return state.copyWith(
//       currentRoute: route
//     );
//   }
//
//   MyNavigatorState _mapNavigatorNextRouteToState(
//       NavigatorNextRoute event,
//       MyNavigatorState state,
//       ){
//     String route = state.currentRoute;
//     int currentRouteIndex = getCurrentRouteIndex();
//
//     if(currentRouteIndex + 1 < routes.length){
//       route = routes[currentRouteIndex + 1];
//       navigatorKey.currentState.pushNamed(route);
//       routeStack.add(route);
//     }
//
//     return state.copyWith(
//         currentRoute: route
//     );
//   }
//
//   MyNavigatorState _mapNavigatorPopRouteToState(
//       NavigatorPopRoute event,
//       MyNavigatorState state,
//       ){
//     int currentRouteIndex = getCurrentRouteIndex();
//
//     if(currentRouteIndex - 1 >= 0){
//       navigatorKey.currentState.pop();
//       routeStack.removeLast();
//     }
//
//     return state.copyWith(
//         currentRoute: routeStack.last
//     );
//   }
// }
