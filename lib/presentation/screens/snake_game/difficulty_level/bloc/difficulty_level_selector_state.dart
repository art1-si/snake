part of 'difficulty_level_selector_bloc.dart';

class DifficultyLevelSelectorState {
  const DifficultyLevelSelectorState({required this.difficultyLevel});

  factory DifficultyLevelSelectorState.easy() {
    return const DifficultyLevelSelectorState(difficultyLevel: DifficultyLevel.easy);
  }

  factory DifficultyLevelSelectorState.medium() {
    return const DifficultyLevelSelectorState(difficultyLevel: DifficultyLevel.medium);
  }

  factory DifficultyLevelSelectorState.hard() {
    return const DifficultyLevelSelectorState(difficultyLevel: DifficultyLevel.hard);
  }

  final DifficultyLevel difficultyLevel;
}
