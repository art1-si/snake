import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/controller/gameplay_controller.dart';
import 'package:snake/presentation/screens/snake_game/snake_game/bloc/gameplay_bloc/gameplay_bloc.dart';
import 'package:snake/presentation/screens/snake_game/snake_game/view/widgets/game_over_dialog.dart';

class GameplayControlOverlay extends StatefulWidget {
  const GameplayControlOverlay({
    super.key,
    required this.gameplayController,
  });

  final GameplayController gameplayController;

  @override
  State<GameplayControlOverlay> createState() => _GameplayControlOverlayState();
}

class _GameplayControlOverlayState extends State<GameplayControlOverlay> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: BlocConsumer<GameplayBloc, GameplayState>(
        listener: (context, state) {
          if (state is GameOver) {
            GameOverDialog.show(context, score: state.score, onRestart: () {
              widget.gameplayController.startGame();
            });
          }
        },
        builder: (context, state) {
          switch (state) {
            case GameplayInitial():
            case GameOver():
              return PlayButton(
                onPressed: () {
                  widget.gameplayController.startGame();
                },
              );
            case GameInProgress():
              return const SizedBox.shrink();
            case GameOnPaused():
              return PlayButton(
                onPressed: () {
                  widget.gameplayController.resumeGame();
                },
              );
          }
        },
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Play'),
    );
  }
}
