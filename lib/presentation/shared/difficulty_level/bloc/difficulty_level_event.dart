part of 'difficulty_level_bloc.dart';

sealed class DifficultyLevelEvent {}

final class DifficultyLevelChanged extends DifficultyLevelEvent {
  final DifficultyLevel difficultyLevel;

  DifficultyLevelChanged(this.difficultyLevel);
}
