import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snake/presentation/navigation/navigation_route.dart';
import 'package:snake/presentation/screens/home/home_screen.dart';
import 'package:snake/presentation/screens/snake_game/snake_game/view/snake_game_screen.dart';

/// The App Router class for the App.
///
/// This class is responsible for setting up the App's navigation.
/// It uses the [GoRouter] package to handle navigation.
class AppRouter {
  AppRouter._();

  static final AppRouter instance = AppRouter._();

  /// The (Main) Navigation Delegate for the App.
  static final GoRouter router = instance._goRouter;

  final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  /// The GoRouter instance.
  late final GoRouter _goRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: NavigationRoute.home.path,
    routes: NavigationRoute.values.map((route) {
      return GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: route.key,
        path: route.path,
        builder: (context, state) => screenBuilder(context, state, route),
      );
    }).toList(),
  );

  /// The screen builder.
  ///
  /// This method is called when the router navigates to a new route.
  /// It returns the [Widget] that should be displayed on the screen based on the [NavigationRoute].
  Widget screenBuilder(BuildContext context, GoRouterState state, NavigationRoute route) {
    return switch (route) {
      NavigationRoute.home => const HomeScreen(),
      NavigationRoute.snakeGame => SneakGameScreen.create(),
    };
  }
}
