import 'package:flutter/material.dart';
import 'package:pathway_mobile/screens/game_screen.dart';
import 'package:pathway_mobile/screens/home_screen.dart';
import 'package:pathway_mobile/screens/lobby_screen.dart';

/// To add a new route:
/// 1. Add a new value to this enum.
/// 2. Add new cases to the `builder` getters.
enum AppRoutes {
  home("/home"),
  lobby("/lobby"),
  game("/game");

  final String name;

  const AppRoutes(this.name);

  WidgetBuilder get builder {
    switch (this) {
      case AppRoutes.home:
        return (context) => const HomeScreen();
      case AppRoutes.lobby:
        return (context) => const LobbyScreen();
      case AppRoutes.game:
        return (context) => const GameScreen();
    }
  }
}

/// Routes builder for MaterialApp based on AppRoutes enum.
class AppRouter {
  final Map<String, WidgetBuilder> routes;

  AppRouter() : routes = _buildRoutes();

  /// Builds the app routes for the MaterialApp' routes with strict typing
  /// based on the AppRoutes enum.
  static Map<String, WidgetBuilder> _buildRoutes() {
    Map<String, WidgetBuilder> routes = {};

    for (var route in AppRoutes.values) {
      routes[route.name] = route.builder;
    }

    return routes;
  }
}

void navigateToRoute<Arguments>(
  BuildContext context,
  AppRoutes route, {
  Arguments? arguments,
}) {
  Navigator.of(context).pushNamed(route.name, arguments: arguments);
}
