import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake/presentation/screens/snake_game/difficulty_level/bloc/difficulty_level_selector_bloc.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/controller/direction_controller.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/controller/gameplay_controller.dart';
import 'package:snake/presentation/screens/snake_game/widgets/direction_controls/direction_control_cluster.dart';
import 'package:snake/presentation/screens/snake_game/widgets/snake_game/bloc/gameplay_bloc/gameplay_bloc.dart';
import 'package:snake/presentation/screens/snake_game/widgets/snake_game/view/widgets/gameplay_controller_listener.dart';
import 'package:snake/presentation/screens/snake_game/widgets/snake_game/view/snake_game.dart';
import 'package:snake/presentation/screens/snake_game/widgets/snake_game/view/widgets/gameplay_control_overlay.dart';
import 'package:snake/presentation/screens/snake_game/widgets/snake_game/view/widgets/score_display.dart';
import 'package:snake/presentation/theme/app_colors.dart';
import 'package:snake/presentation/theme/styled_text.dart';

class SneakGameScreen extends StatefulWidget {
  const SneakGameScreen._({super.key});

  static Widget create({Key? key}) {
    return BlocProvider(
      create: (context) => GameplayBloc(),
      child: SneakGameScreen._(
        key: key,
      ),
    );
  }

  @override
  State<SneakGameScreen> createState() => _SneakGameScreenState();
}

class _SneakGameScreenState extends State<SneakGameScreen> {
  final directionController = DirectionController();
  final gameplayController = GameplayController();
  @override
  Widget build(BuildContext context) {
    return GameplayControllerListener(
      gameplayController: gameplayController,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            const SizedBox(height: 64),
            StyledText.heading1('Snake Game'),
            const SizedBox(height: 16),
            const ScoreDisplay(),
            Center(
              child: GameplayControlOverlay(
                gameplayController: gameplayController,
              ),
            ),
            Expanded(
              child: Center(
                child: SnakeGame(
                  difficultyLevel: DifficultyLevelSelectorState.easy().difficultyLevel,
                  directionController: directionController,
                  gameplayController: gameplayController,
                  onAppleEaten: () {
                    context.read<GameplayBloc>().add(const AppleEaten());
                  },
                ),
              ),
            ),
            DirectionControlCluster(
              directionController: directionController,
            ),
          ],
        ),
      ),
    );
  }
}
