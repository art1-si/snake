import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake/presentation/screens/snake_game/widgets/snake_game/bloc/gameplay_bloc/gameplay_bloc.dart';

class GameplayBlocProvider extends StatelessWidget {
  const GameplayBlocProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameplayBloc(),
      child: child,
    );
  }
}
