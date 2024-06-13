import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snake/presentation/shared/difficulty_level/bloc/difficulty_level_bloc.dart';
import 'package:snake/presentation/shared/difficulty_level/model/difficulty_level.dart';
import 'package:snake/presentation/shared/select_button_row/model/selectable_item.dart';
import 'package:snake/presentation/shared/select_button_row/view/select_button_row.dart';
import 'package:snake/presentation/theme/app_colors.dart';
import 'package:snake/presentation/theme/styled_text.dart';

/// A widget that allows the user to select a difficulty level for the snake game.
class DifficultyLevelSelector extends StatelessWidget {
  const DifficultyLevelSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StyledText.body(
          'Select Difficulty Level',
          color: AppColors.primary,
        ),
        const SizedBox(height: 16),
        BlocBuilder<DifficultyLevelBloc, DifficultyLevelState>(
          builder: (context, state) {
            return SelectButtonRow<DifficultyLevel>(
                value: state.difficultyLevel,
                onChanged: (difficultyLevel) {
                  context.read<DifficultyLevelBloc>().add(DifficultyLevelChanged(difficultyLevel));
                },
                items: [
                  SelectableItem(
                    item: DifficultyLevel.easy,
                    child: StyledText.body('Easy'),
                  ),
                  SelectableItem(
                    item: DifficultyLevel.medium,
                    child: StyledText.body('Medium'),
                  ),
                  SelectableItem(
                    item: DifficultyLevel.hard,
                    child: StyledText.body('Hard'),
                  ),
                ]);
          },
        ),
      ],
    );
  }
}
