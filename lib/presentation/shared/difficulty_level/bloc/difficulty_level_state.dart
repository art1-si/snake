part of 'difficulty_level_bloc.dart';

class DifficultyLevelState {
  const DifficultyLevelState({required this.difficultyLevel});

  factory DifficultyLevelState.easy() {
    return const DifficultyLevelState(difficultyLevel: DifficultyLevel.easy);
  }

  factory DifficultyLevelState.medium() {
    return const DifficultyLevelState(difficultyLevel: DifficultyLevel.medium);
  }

  factory DifficultyLevelState.hard() {
    return const DifficultyLevelState(difficultyLevel: DifficultyLevel.hard);
  }

  final DifficultyLevel difficultyLevel;
}
