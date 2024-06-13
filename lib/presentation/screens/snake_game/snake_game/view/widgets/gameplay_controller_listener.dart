import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/controller/gameplay_controller.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/gameplay_event.dart';
import 'package:snake/presentation/screens/snake_game/snake_game/bloc/gameplay_bloc/gameplay_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameplayControllerListener extends StatefulWidget {
  const GameplayControllerListener({
    super.key,
    required this.gameplayController,
    required this.child,
  });

  final Widget child;
  final GameplayController gameplayController;

  @override
  State<GameplayControllerListener> createState() => _GameplayControllerListenerState();
}

class _GameplayControllerListenerState extends State<GameplayControllerListener> {
  @override
  void initState() {
    super.initState();
    widget.gameplayController.addListener(gameplayControllerListener);
  }

  @override
  void dispose() {
    widget.gameplayController.removeListener(gameplayControllerListener);
    super.dispose();
  }

  void gameplayControllerListener(GameplayEvents event) {
    switch (event) {
      case StartGame():
        context.read<GameplayBloc>().add(const GameStarted());
        break;
      case PauseGame():
        context.read<GameplayBloc>().add(const GamePaused());
        break;
      case ResumeGame():
        context.read<GameplayBloc>().add(const GameResumed());
        break;
      case EndGame():
        context.read<GameplayBloc>().add(const GameEnded());
        break;
      case TickerEvent():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
