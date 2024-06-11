import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/difficulty_level/bloc/difficulty_level_selector_bloc.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/controller/direction_controller.dart';
import 'package:snake/presentation/screens/snake_game/widgets/game_controller/direction_controls.dart';
import 'package:snake/presentation/screens/snake_game/widgets/game_display/game_display.dart';
import 'package:snake/presentation/theme/app_colors.dart';
import 'package:snake/presentation/theme/styled_text.dart';

class SneakGameScreen extends StatefulWidget {
  const SneakGameScreen({super.key});

  @override
  State<SneakGameScreen> createState() => _SneakGameScreenState();
}

class _SneakGameScreenState extends State<SneakGameScreen> {
  final directionController = DirectionController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const SizedBox(height: 64),
          Container(
            height: 100,
            color: AppColors.primary,
            alignment: Alignment.center,
            child: StyledText.heading2(
              'Add SCORE HERE',
            ),
          ),
          Expanded(
            child: Center(
              child: SnakeGame(
                difficultyLevel: DifficultyLevelSelectorState.easy().difficultyLevel,
                directionController: directionController,
              ),
            ),
          ),
          DirectionControls(
            directionController: directionController,
          ),
        ],
      ),
    );
  }
}
