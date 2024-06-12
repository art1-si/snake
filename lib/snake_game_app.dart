import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake/presentation/navigation/router.dart';
import 'package:snake/presentation/shared/difficulty_level/bloc/difficulty_level_bloc.dart';

class SnakeGameApp extends StatelessWidget {
  const SnakeGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DifficultyLevelBloc(),
      child: MaterialApp.router(
        themeMode: ThemeMode.dark,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
