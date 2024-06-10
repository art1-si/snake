enum NavigationRoute {
  home(path: '/home', key: 'home'),
  settings(path: '/settings', key: 'settings'),
  leaderboard(path: '/dashboard', key: 'dashboard'),
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
