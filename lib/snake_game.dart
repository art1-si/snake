import 'package:flutter/material.dart';
import 'package:snake/presentation/navigation/router.dart';

class SnakeGameApp extends StatelessWidget {
  const SnakeGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
