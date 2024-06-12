import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake/presentation/screens/snake_game/snake_game/bloc/gameplay_bloc/gameplay_bloc.dart';
import 'package:snake/presentation/theme/styled_text.dart';

class ScoreDisplay extends StatelessWidget {
  const ScoreDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: BlocBuilder<GameplayBloc, GameplayState>(
        builder: (context, state) {
          switch (state) {
            case GameplayInitial():
            case GameOnPaused():
            case GameOver():
              return const SizedBox();
            case GameInProgress():
              return StyledText.heading2(
                'Score: ${state.score}',
              );
          }
        },
      ),
    );
  }
}
