/// Enum to define all the routes in the app.
///
/// It contains the path of the route and a key identifier.
enum NavigationRoute {
  home(path: '/home', key: 'home'),
  snakeGame(path: '/snakeGame', key: 'snakeGame');

  const NavigationRoute({
    required this.path,
    required this.key,
  });

  /// Path of the Route.
  /// Top-Level routes need to start with a `/`
  /// Nested Routes should NOT start with a `/`.
  final String path;

  // Key identifier of the Route. Needed for GoRouter.
  final String key;
}
