import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake/presentation/screens/snake_game/snake_game/bloc/gameplay_bloc/gameplay_bloc.dart';
import 'package:snake/presentation/theme/app_colors.dart';
import 'package:snake/presentation/theme/styled_text.dart';

class ScoreDisplay extends StatefulWidget {
  const ScoreDisplay({super.key});

  @override
  State<ScoreDisplay> createState() => _ScoreDisplayState();
}

class _ScoreDisplayState extends State<ScoreDisplay> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BlocBuilder<GameplayBloc, GameplayState>(
        builder: (context, state) {
          switch (state) {
            case GameplayInitial():
            case GameOnPaused():
            case GameOver():
              return const SizedBox();
            case GameInProgress():
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StyledText.heading3('Score'),
                  AnimatedSwitcher(
                    switchInCurve: Curves.elasticOut,
                    switchOutCurve: Curves.easeInOutCubic,
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween(
                              begin: const Offset(10.0, -2.0),
                              end: const Offset(0.0, 0.0),
                            ).animate(animation),
                            child: child,
                          ),
                        ),
                      );
                    },
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      key: Key('${state.score}'),
                      '${state.score}',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
